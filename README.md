# 🛠️ AutoInstall cPanel for AlmaLinux 8 & 9

This script automatically installs **cPanel & WHM** on **AlmaLinux 8 or 9** during the **first root login** via SSH.

> ✅ Ideal for VPS templates, automatic deployments, or provisioning scripts.

---

## 🚀 Features

- ✅ Detects AlmaLinux 8 or 9
- ✅ Shows a countdown with **Ctrl+C cancel option**
- ✅ Installs cPanel inside an interactive `screen` session
- ✅ Pauses at the end and **asks for confirmation before reboot**
- ✅ Cleans up all files and `.bash_profile` entries after execution

---

## 📦 Files Included

| File                         | Description                                 |
|-----------------------------|---------------------------------------------|
| `.autoinstall-cpanel.sh`    | Full logic of the cPanel auto-installer     |
| `README.md`                 | This documentation                          |

---

## 🧑‍💻 How to Use

1. Upload the installer script:

```bash
cp .autoinstall-cpanel.sh /root/
chmod +x /root/.autoinstall-cpanel.sh
```

2. Edit `/root/.bash_profile` and **append** the following line at the end:

```bash
[ -f /root/.autoinstall-cpanel.sh ] && bash /root/.autoinstall-cpanel.sh
```

> 📝 Do **not** overwrite `.bash_profile` if it already contains other custom logic. Just append the line.

3. Done! On the first SSH login as `root`, the script will:
- Show a message with a 10-second countdown
- Let the user cancel with Ctrl+C
- Install cPanel inside a `screen` session
- Wait for ENTER at the end
- Suggest a reboot
- Clean up all traces from the system

---

## ⚠️ Requirements

- AlmaLinux 8.4+ or 9.x (minimal or standard)
- Internet access to `securedownloads.cpanel.net`
- Root SSH access

---

## 🧪 Tested On

- ✅ AlmaLinux 8.10 minimal
- ✅ AlmaLinux 9.4 minimal
- ✅ cPanel & WHM v110–128

---

## 🔁 Reuse and Customization

You can customize the behavior by editing:
- The countdown timer
- The reboot confirmation
- Adding your hostname or license key logic

---

## 📄 License

MIT © [ServerSP](https://serversp.com)

---

## 🌐 Links

- [Official cPanel Installation Guide](https://docs.cpanel.net/installation-guide/)
- [cPanel Licensing Info](https://cpanel.net/pricing/)
