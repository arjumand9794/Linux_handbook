# 📙 FULL LINUX DEVOPS CONTENT  
Complete Linux Server Automation Procedures  
All Commands • All Scripts • All Explanations  
(One single file for full reference)

---

# 🔵 LEVEL 1 — BASIC (FOUNDATIONAL SKILLS)

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

### Explanation
- Creates **devteam** group  
- Creates developer users  
- Adds them to the devteam group  
- Assigns bash shell and home directories  

---

## 2️⃣ Permissions & Ownership

### Commands
```bash
sudo mkdir -p /opt/myapp /var/log/myapp /opt/scripts
sudo chown -R appuser:devteam /opt/myapp /var/log/myapp
sudo chmod -R 770 /opt/myapp
sudo chmod g+s /opt/myapp
```

### Explanation
- `/opt/myapp` → application code  
- `/var/log/myapp` → application logs  
- 770 → only owner & group can access  
- `g+s` → new files inherit devteam group  

---

## 3️⃣ Install Required Packages

```bash
sudo apt update -y
sudo apt install -y git nginx openjdk-11-jdk curl
```

### Installed:
- Git  
- Nginx  
- Java JDK  
- Curl  

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

What this checks:
- CPU  
- Memory  
- Disk  
- OS & Kernel version  

---

# 🟣 LEVEL 2 — INTERMEDIATE (DAILY DEVOPS TASKS)

---

## 5️⃣ Backup Automation

### Backup Script Example:
```bash
#!/bin/bash
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

### 🧹 Cleanup Logs Script
```bash
#!/bin/bash
find /var/log/myapp -type f -mtime +14 -delete
```

### 🔄 Restart App Script
```bash
#!/bin/bash
systemctl restart myapp
systemctl status myapp --no-pager
```

### ❤️ Health Check Script
```bash
#!/bin/bash
URL="http://localhost:8080/health"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
echo "$(date): $STATUS"
```

---

## 7️⃣ Log Management

### Commands
```bash
tail -f /var/log/myapp/app.log
journalctl -u myapp -f
grep -i error /var/log/myapp/app.log
```

---

## 8️⃣ Performance Monitoring

### Tools
```bash
top
htop
iotop
vmstat 1 5
df -h
ss -tulpn
```

---

# 🔴 LEVEL 3 — ADVANCED (PRODUCTION READY)

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

### Edit SSH Config:
```
sudo nano /etc/ssh/sshd_config
```

### Recommended Security Settings:
```
PermitRootLogin no
PasswordAuthentication no
AllowUsers dev1 dev2 appuser
X11Forwarding no
```

### Apply Changes:
```bash
sudo systemctl restart sshd
```

---

## 1️⃣1️⃣ LVM Setup

### Commands
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

### Commands
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

### File: `/etc/logrotate.d/myapp`

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

# 🎉 END OF FULL DOCUMENTATION

This file contains ALL commands, procedures, scripts, and configurations.
