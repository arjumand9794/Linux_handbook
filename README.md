# Linux_handbook
Linux_commands _execution (basics to advanced)
# Linux DevOps Roadmap – App Server Setup

```plaintext
linux-server-automation/
├── README.md
├── ROADMAP/
│   ├── LEVEL_1_BASIC.md
│   ├── LEVEL_2_INTERMEDIATE.md
│   ├── LEVEL_3_ADVANCED.md
│   └── FULL_ROADMAP.md
├── scripts/
│   ├── FULL_PROCEDURE.sh
│   ├── backup_myapp.sh
│   ├── cleanup_logs.sh
│   ├── restart_myapp.sh
│   ├── health_check.sh
│   └── install_packages.sh
├── systemd/
│   └── myapp.service
├── logrotate/
│   └── myapp
├── ssh/
│   └── sshd_hardening.md
├── firewall/
│   └── ufw_rules.md
├── lvm/
│   └── lvm_setup.md
└── assets/
    └── diagrams.png
```


# 📘 Linux & DevOps Roadmap

This roadmap contains clickable sections.  
Open any section to view its full commands and procedures.

---

## 🔵 LEVEL 1 — BASIC  
1. [User & Group Management](FULL_CONTENT.md#1-user--group-management)  
2. [Permissions & Ownership](FULL_CONTENT.md#2-permissions--ownership)  
3. [Install Packages](FULL_CONTENT.md#3-install-required-packages)  
4. [System Information](FULL_CONTENT.md#4-system-information-commands)

---

## 🟣 LEVEL 2 — INTERMEDIATE  
5. [Backup Automation](FULL_CONTENT.md#5-backup-automation)  
6. [Shell Scripts (Cleanup, Restart, Health)](FULL_CONTENT.md#6-shell-scripts)  
7. [Log Management](FULL_CONTENT.md#7-log-management)  
8. [Performance Monitoring](FULL_CONTENT.md#8-performance-monitoring)

---

## 🔴 LEVEL 3 — ADVANCED  
9. [Create systemd Service](FULL_CONTENT.md#9-create-systemd-service)  
10. [SSH Hardening](FULL_CONTENT.md#10-ssh-hardening)  
11. [LVM Storage Setup](FULL_CONTENT.md#11-lvm-setup)  
12. [Firewall Rules](FULL_CONTENT.md#12-firewall-rules)  
13. [Logrotate Configuration](FULL_CONTENT.md#13-logrotate)

---
# 📙 FULL LINUX DEVOPS CONTENT  
(All procedures + commands in one file)

---

# 🔵 LEVEL 1 — BASIC

---

## 1️⃣ User & Group Management
### Commands
```bash
sudo groupadd devteam
sudo useradd -m -s /bin/bash -G devteam dev1
sudo useradd -m -s /bin/bash -G devteam dev2
sudo useradd -m -s /bin/bash -G devteam appuser
sudo passwd dev1
sudo passwd dev2
sudo passwd appuser
```

### Purpose
- Create developer group  
- Add users  
- Provide home directory & bash shell  

---

## 2️⃣ Permissions & Ownership
### Commands
```bash
sudo mkdir -p /opt/myapp /var/log/myapp /opt/scripts
sudo chown -R appuser:devteam /opt/myapp /var/log/myapp
sudo chmod -R 770 /opt/myapp
sudo chmod g+s /opt/myapp
```

### Purpose
- 770 = owner & group full access  
- Others restricted  
- g+s ensures group inheritance  

---

## 3️⃣ Install Required Packages
```bash
sudo apt update -y
sudo apt install -y git nginx openjdk-11-jdk curl
```

---

## 4️⃣ System Information Commands

```bash
lscpu
free -h
df -h
lsblk
uname -a
cat /etc/os-release
```

---

# 🟣 LEVEL 2 — INTERMEDIATE

---

## 5️⃣ Backup Automation
### Script: `/opt/scripts/backup_myapp.sh`
```bash
SRC="/opt/myapp"
DEST="/backup/myapp"
TS=$(date +%F-%H-%M-%S)
mkdir -p $DEST
tar -czf $DEST/myapp-$TS.tar.gz $SRC
find $DEST -type f -mtime +7 -delete
```

### Cron Job
```
0 2 * * * /opt/scripts/backup_myapp.sh
```

---

## 6️⃣ Shell Scripts

### cleanup_logs.sh
```bash
find /var/log/myapp -type f -mtime +14 -delete
```

### restart_myapp.sh
```bash
systemctl restart myapp
systemctl status myapp --no-pager
```

### health_check.sh
```bash
URL="http://localhost:8080/health"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
echo "$(date): $STATUS"
```

---

## 7️⃣ Log Management

```bash
tail -f /var/log/myapp/app.log
journalctl -u myapp -f
grep -i error /var/log/myapp/app.log
```

---

## 8️⃣ Performance Monitoring

```bash
top
htop
iotop
vmstat 1 5
df -h
ss -tulpn
```

---

# 🔴 LEVEL 3 — ADVANCED

---

## 9️⃣ Create systemd Service
### File: `/etc/systemd/system/myapp.service`
```ini
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
```

### Commands
```bash
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp
sudo journalctl -u myapp -f
```

---

## 🔟 SSH Hardening

### Edit file:
```
/etc/ssh/sshd_config
```

### Recommended Settings
```
PermitRootLogin no
PasswordAuthentication no
AllowUsers dev1 dev2 appuser
X11Forwarding no
```

### Apply Changes
```bash
sudo systemctl restart sshd
```

---

## 1️⃣1️⃣ LVM Setup

```bash
sudo pvcreate /dev/sdb
sudo vgcreate vg_data /dev/sdb
sudo lvcreate -L 50G -n lv_data vg_data
sudo mkfs.ext4 /dev/vg_data/lv_data
sudo mkdir /data
sudo mount /dev/vg_data/lv_data /data
```

---

## 1️⃣2️⃣ Firewall Rules

```bash
sudo apt install ufw -y
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8080/tcp
sudo ufw enable
```

---

## 1️⃣3️⃣ Logrotate

### File:
`/etc/logrotate.d/myapp`

```
/var/log/myapp/*.log {
  daily
  rotate 14
  compress
  missingok
  notifempty
  copytruncate
}
```

---

# 🎉 END OF COMPLETE DOCUMENTATION
All commands + scripts + procedures in one single file.

👉 **Full documentation:**  
Click here → **[FULL_CONTENT.md](FULL_CONTENT.md)**


