![Banner](https://raw.githubusercontent.com/ahmadsheikhi89/nfs-server-setup-v4/main/banner.png)

# 📦 NFS Server Setup for Rocky Linux 9.5 (NFSv4)

![Shell Script](https://img.shields.io/badge/shell-bash-blue?logo=gnu-bash)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![OS: Rocky Linux 9.5](https://img.shields.io/badge/OS-Rocky%20Linux%209.5-00bfff?logo=linux)
![NFS Version](https://img.shields.io/badge/NFS-v4-orange)

> 📌 **Note:** This project is built using **NFSv4**, ideal for modern infrastructure with SELinux and firewalld support. If you’re looking for a simpler version compatible with legacy systems, check out the [NFSv3 version here](https://github.com/ahmadsheikhi89/nfs-server-setup).

---
🔄 NFSv3 vs NFSv4: Key Differences

Feature

NFSv3

NFSv4

🔐 Security & Identity

Basic (UID/GID only)

Supports strong identity mapping (idmapd)

🔥 Firewall simplicity

Needs multiple ports open

Single port (TCP 2049)

📁 Mount behavior

Absolute paths per export

Relative paths under export root (fsid=0)

🧩 Extra daemons

Needs rpcbind, mountd

Doesn't require mountd

🔐 SELinux interaction

May need more exceptions

Cleaner integration with SELinux

📡 Protocol type

Stateless

Stateful with locking and delegation
---
## ✍️ Author
**Ahmad Sheikhi**  
🔗 [GitHub Profile](https://github.com/ahmadsheikhi89)

---

## 📜 Features
- Full NFSv4 support with root export (fsid=0)
- One-port firewall simplicity (TCP 2049 only)
- idmapd configuration included
- SELinux and firewalld integrated
- Server and client setup scripts
- Educational and production-ready

---

## 📂 Project Structure
```bash
nfs-server-setup-v4/
├── nfs-server-setup-v4.sh       # Server setup script
├── nfs-client-setup-v4.sh       # Client setup script
├── exports.sample               # NFSv4 export file
├── fstab.sample                 # Example persistent mount config
├── idmapd.conf.sample           # Identity mapping config
├── LICENSE                      # MIT license
├── README.md                    # This file
```

---

## 🚀 Usage

### 🔧 Server Setup
```bash
sudo bash nfs-server-setup-v4.sh
```

### 💻 Client Setup
```bash
sudo bash nfs-client-setup-v4.sh
```

---

## 🛠️ Script Summary

### `nfs-server-setup-v4.sh`
- Installs required packages: `nfs-utils`, `firewalld`, etc.
- Creates root export (`/srv/nfs`) and subdirectories
- Adds `fsid=0` for NFSv4 root
- Sets SELinux and firewalld
- Writes a minimal `idmapd.conf`

### `nfs-client-setup-v4.sh`
- Installs NFS client utilities
- Configures mount point and `/etc/fstab`
- Adds matching `idmapd.conf`

---

## 🧾 Sample Configuration Files

### `exports.sample`
```bash
/srv/nfs         192.168.0.0/24(ro,sync,no_subtree_check,fsid=0)
/srv/nfs/data    192.168.0.0/24(rw,sync,no_subtree_check)
```

### `fstab.sample`
```bash
192.168.0.10:/data /mnt/nfs/data nfs4 defaults 0 0
```

### `idmapd.conf.sample`
```ini
[General]
Domain = localdomain
```

---

## 📌 Requirements
- Rocky Linux 9.5 (server and clients)
- SELinux (enforced or permissive)
- Systemd-based firewall (`firewalld`)

---

## 📄 License
MIT — use, customize, or redistribute freely. Contributions welcome!

---

## 🤝 Contributions
Pull requests are welcome for enhancements like:
- Kerberos authentication
- Prometheus monitoring
- Docker/NFS volume integration

