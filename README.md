# 🛠️ AutoInstall cPanel for AlmaLinux 8 & 9

This open-source script automates the full installation of **cPanel & WHM** on **AlmaLinux 8 or 9** upon the first SSH login as root.

Developed by [ServerSP](https://serversp.com), an infrastructure provider serving global clients — including a dedicated portal for [Brazil](https://serversp.com.br).

---

## 🚀 What It Does

- ✅ Detects AlmaLinux 8 or 9
- ✅ Displays a clear countdown before starting (with Ctrl+C cancel option)
- ✅ Updates the system and installs all necessary dependencies
- ✅ Installs cPanel inside a `screen` session with interactive output
- ✅ Waits for user confirmation before rebooting the system
- ✅ Removes all temporary files and installer references after completion

---

## 📂 Files Included

| File                         | Description                                 |
|-----------------------------|---------------------------------------------|
| `.autoinstall-cpanel.sh`    | Main installer logic                        |
| `README.md`                 | This documentation                          |

---

## 📦 How to Use

1. Upload the script to your server:
```bash
cp .autoinstall-cpanel.sh /root/
chmod +x /root/.autoinstall-cpanel.sh
```

2. Edit your `.bash_profile` and append:
```bash
[ -f /root/.autoinstall-cpanel.sh ] && bash /root/.autoinstall-cpanel.sh
```

> Do not overwrite `.bash_profile` if it contains other startup logic — just add the line at the end.

3. On first SSH login:
- You'll see a countdown and option to cancel
- Installation runs inside a screen session
- You'll be asked to confirm before reboot
- All scripts remove themselves after completion

---

## 🌐 Ideal Use Cases

This project is suitable for:
- VPS or dedicated server provisioning
- Template-based deployments

---

## ⚠️ Requirements

- AlmaLinux 8.4+ or 9.x (minimal or standard)
- Root SSH access
- Internet access to `securedownloads.cpanel.net`

---

## ✅ Tested On

- AlmaLinux 8.10 (minimal)
- AlmaLinux 9.4 (minimal)
- cPanel versions: 110 to 128

---

## 🛠️ Customization Ideas

You can adjust:
- Countdown duration
- Reboot behavior
- Hostname injection
- Integration with license activation systems

---

## 📄 License

MIT © [ServerSP](https://serversp.com)

---

## 🔗 Related Resources

- [cPanel Official Installation Guide](https://docs.cpanel.net/installation-guide/)
- [cPanel Pricing & Licensing](https://cpanel.net/pricing/)
- [ServerSP — Infrastructure & Servers](https://serversp.com)
