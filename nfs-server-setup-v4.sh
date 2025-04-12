#!/bin/bash
if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit 1; fi
dnf install -y nfs-utils firewalld policycoreutils-python-utils
systemctl enable --now nfs-server firewalld
mkdir -p /srv/nfs/data
chown -R nfsnobody:nfsnobody /srv/nfs
chmod -R 755 /srv/nfs
cat <<EOF > /etc/exports
/srv/nfs         192.168.0.0/24(ro,sync,no_subtree_check,fsid=0)
/srv/nfs/data    192.168.0.0/24(rw,sync,no_subtree_check)
EOF
exportfs -rav
firewall-cmd --permanent --add-service=nfs
firewall-cmd --reload
setsebool -P nfs_export_all_rw 1
echo -e "[General]\nDomain = localdomain" > /etc/idmapd.conf
echo "✅ NFSv4 server setup completed."
