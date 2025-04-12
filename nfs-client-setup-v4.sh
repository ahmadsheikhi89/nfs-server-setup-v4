#!/bin/bash
if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit 1; fi
dnf install -y nfs-utils
mkdir -p /mnt/nfs/data
mount -t nfs4 192.168.0.10:/data /mnt/nfs/data
echo "192.168.0.10:/data /mnt/nfs/data nfs4 defaults 0 0" >> /etc/fstab
echo -e "[General]\nDomain = localdomain" > /etc/idmapd.conf
echo "✅ NFSv4 client setup completed."
