#!/bin/bash

echo "=== Creating directory structure ==="

# LEVEL 1 -----------------------------------------------------------
mkdir -p level-1-basic

echo "Creating Level 1 files..."

cat > level-1-basic/users-and-groups.md << 'EOF'
# Users & Groups Setup

## Create Group
```bash
sudo groupadd devteam
```

## Create Users
```bash
sudo useradd -m -s /bin/bash -G devteam dev1
sudo useradd -m -s /bin/bash -G devteam dev2
sudo useradd -m -s /bin/bash -G devteam appuser
```

## Set Passwords
```bash
sudo passwd dev1
sudo passwd dev2
sudo passwd appuser
```

## Verify
```bash
id dev1
```
EOF

cat > level-1-basic/permissions.md << 'EOF'
# Permissions Setup

```bash
sudo mkdir -p /opt/myapp /var/log/myapp /opt/scripts
sudo chown -R appuser:devteam /opt/myapp /var/log/myapp
sudo chmod -R 770 /opt/myapp
sudo chmod g+s /opt/myapp
```
EOF

cat > level-1-basic/packages-installation.md << 'EOF'
# Package Installation (Git, Nginx, Java)

```bash
sudo apt update -y
sudo apt install -y git nginx openjdk-11-jdk curl
```
EOF

cat > level-1-basic/system-info.md << 'EOF'
# System Information Commands

```bash
lscpu
free -h
df -h
lsblk
uname -a
cat /etc/os-release
```
EOF


# LEVEL 2 -----------------------------------------------------------
mkdir -p level-2-intermediate

echo "Creating Level 2 files..."

cat > level-2-intermediate/backup-cron.sh << 'EOF'
#!/bin/bash
SRC="/opt/myapp"
DEST="/backup/myapp"
TS=$(date +%F-%H-%M-%S)
mkdir -p $DEST
tar -czf $DEST/myapp-$TS.tar.gz $SRC
find $DEST -mtime +7 -delete
EOF

cat > level-2-intermediate/log-cleanup.sh << 'EOF'
#!/bin/bash
find /var/log/myapp -type f -mtime +14 -delete
EOF

cat > level-2-intermediate/health-check.sh << 'EOF'
#!/bin/bash
URL="http://localhost:8080/health"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
echo "$(date): $STATUS"
EOF

cat > level-2-intermediate/service-restart.sh << 'EOF'
#!/bin/bash
systemctl restart myapp
systemctl status myapp --no-pager
EOF

cat > level-2-intermediate/logs-monitoring.md << 'EOF'
# Log Monitoring Commands

```bash
tail -f /var/log/myapp/app.log
journalctl -u myapp -f
grep -i error /var/log/myapp/app.log
```
EOF


# LEVEL 3 -----------------------------------------------------------
mkdir -p level-3-advanced

echo "Creating Level 3 files..."

cat > level-3-advanced/myapp.service << 'EOF'
[Unit]
Description=MyApp Service
After=network.target

[Service]
User=appuser
Group=devteam
WorkingDirectory=/opt/myapp
ExecStart=/opt/myapp/bin/start.sh
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

cat > level-3-advanced/ssh-hardening.md << 'EOF'
# SSH Hardening Guide

```
PermitRootLogin no
PasswordAuthentication no
AllowUsers dev1 dev2 appuser
```
EOF

cat > level-3-advanced/lvm-setup.md << 'EOF'
# LVM Setup

```bash
pvcreate /dev/sdb
vgcreate vg_data /dev/sdb
lvcreate -L 50G -n lv_data vg_data
mkfs.ext4 /dev/vg_data/lv_data
mount /dev/vg_data/lv_data /data
```
EOF

cat > level-3-advanced/firewall-rules.md << 'EOF'
# Firewall Rules

```bash
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw enable
```
EOF

cat > level-3-advanced/logrotate.conf << 'EOF'
/var/log/myapp/*.log {
  daily
  rotate 14
  compress
  copytruncate
  notifempty
}
EOF

echo "=== All files created successfully! ==="

