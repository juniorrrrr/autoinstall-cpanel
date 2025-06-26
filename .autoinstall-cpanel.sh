#!/bin/bash
#
# Script: /root/.autoinstall-cpanel.sh
# Version: v1.7
# Description: Auto-installs cPanel on AlmaLinux 8/9 during first root SSH login.
# Cleanup: Deletes itself and its reference in .bash_profile after execution.

if [ -f /root/.cpanel_installer_done ] || [ -f /root/.cpanel_install_cancelled ]; then
    exit 0
fi

OS_VERSION=$(rpm -E %{rhel})
clear

if [[ "$OS_VERSION" -ne 8 && "$OS_VERSION" -ne 9 ]]; then
    echo "❌ Unsupported OS version: AlmaLinux $OS_VERSION"
    echo "This installer supports only AlmaLinux 8 or 9."
    touch /root/.cpanel_install_cancelled
    sed -i '/.autoinstall-cpanel.sh/d' /root/.bash_profile
    rm -f /root/.autoinstall-cpanel.sh
    exit 1
fi

SERVER_IP=$(hostname -I | awk '{print $1}')

echo "======================================================"
echo "     Welcome to your AlmaLinux $OS_VERSION server"
echo "------------------------------------------------------"
echo " cPanel & WHM installation will start in 10 seconds."
echo " Estimated time: 5 to 15 minutes."
echo
echo " Press Ctrl+C now to CANCEL permanently."
echo "======================================================"
echo

trap 'echo -e "\nInstallation cancelled by user. It will not run again."; touch /root/.cpanel_install_cancelled; sed -i "/.autoinstall-cpanel.sh/d" /root/.bash_profile; rm -f /root/.autoinstall-cpanel.sh; exit 1' INT

for i in {10..1}; do
    echo -ne " Starting in $i seconds... Press Ctrl+C to cancel... \r"
    sleep 1
done

echo -e "\nStarting installation..."

dnf -y update
dnf -y install epel-release
dnf config-manager --set-enabled epel
dnf -y update --refresh
dnf -y install perl curl screen

touch /root/.cpanel_installer_done

cat <<EOF > /root/cpanel_installer.sh
#!/bin/bash
cd /home || exit 1
curl -o latest -L https://securedownloads.cpanel.net/latest
sh latest

clear
echo "======================================================"
echo "✅ cPanel & WHM installation completed successfully!"
echo " Access WHM at: https://$SERVER_IP:2087"
echo " Username: root  |  Use your root password"
echo "======================================================"
echo
echo "⚠️ It is strongly recommended to reboot your server now."
echo "Press ENTER to reboot..."
read

rm -f /root/cpanel_installer.sh
sed -i '/.autoinstall-cpanel.sh/d' /root/.bash_profile
rm -f /root/.autoinstall-cpanel.sh

reboot
EOF

chmod +x /root/cpanel_installer.sh
exec screen -S cpanel-install /root/cpanel_installer.sh
