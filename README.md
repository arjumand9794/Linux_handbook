# Linux_handbook
Linux_commands _execution (basics to advanced)
# Linux DevOps Roadmap – App Server Setup

Scenario: I am a DevOps engineer automating Linux server setup for a new application.

---

## Table of Contents

-linux-server-automation/
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

# FULL LINUX SERVER AUTOMATION SCRIPT FOR DEVOPS

echo "==== Starting Linux Server Setup ===="

### VARIABLES ###
APPUSER="appuser"
APPGROUP="devteam"
APPDIR="/opt/myapp"
LOGDIR="/var/log/myapp"
SCRIPTDIR="/opt/scripts"

echo "==== LEVEL 1 — BASIC SETUP ===="

##########################
### 1. USERS & GROUPS  ###
##########################
echo "[+] Creating users & groups..."
groupadd $APPGROUP
useradd -m -s /bin/bash -G $APPGROUP dev1
useradd -m -s /bin/bash -G $APPGROUP dev2
useradd -m -s /bin/bash -G $APPGROUP $APPUSER

###############################
### 2. PERMISSIONS SETUP   ###
###############################
echo "[+] Setting up directories and permissions..."
mkdir -p $APPDIR $LOGDIR $SCRIPTDIR
chown -R $APPUSER:$APPGROUP $APPDIR $LOGDIR
chmod -R 770 $APPDIR
chmod g+s $APPDIR

################################
### 3. INSTALL PACKAGES      ###
################################
echo "[+] Installing Git, Nginx and Java..."
apt update -y
apt install -y git nginx openjdk-11-jdk curl

################################
### 4. SYSTEM INFORMATION    ###
################################
echo "[+] System Information:"
lscpu
free -h
df -h
uname -a
lsblk

echo "==== LEVEL 2 — INTERMEDIATE TASKS ===="

####################################
### 5. BACKUP AUTOMATION SCRIPT  ###
####################################
echo "[+] Creating backup script..."

cat << 'EOF' > $SCRIPTDIR/backup_myapp.sh
#!/bin/bash
SRC_DIR="/opt/myapp"
DEST_DIR="/backup/myapp"
TS=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="${DEST_DIR}/myapp-${TS}.tar.gz"
mkdir -p "${DEST_DIR}"
tar -czf "${BACKUP_FILE}" "${SRC_DIR}"
find "${DEST_DIR}" -type f -name "*.tar.gz" -mtime +7 -delete
EOF

chmod +x $SCRIPTDIR/backup_myapp.sh
mkdir -p /backup/myapp

(crontab -l 2>/dev/null; echo "0 2 * * * $SCRIPTDIR/backup_myapp.sh") | crontab -

########################################
### 6. CLEANUP + RESTART + HEALTH   ###
########################################

# Cleanup Script
echo "[+] Creating cleanup script..."
cat << 'EOF' > $SCRIPTDIR/cleanup_logs.sh
#!/bin/bash
find /var/log/myapp -type f -name "*.log" -mtime +14 -delete
EOF
chmod +x $SCRIPTDIR/cleanup_logs.sh

# Restart Script
echo "[+] Creating restart script..."
cat << 'EOF' > $SCRIPTDIR/restart_myapp.sh
#!/bin/bash
systemctl restart myapp
systemctl status myapp --no-pager
EOF
chmod +x $SCRIPTDIR/restart_myapp.sh

# Health-check Script
echo "[+] Creating health-check script..."
cat << 'EOF' > $SCRIPTDIR/health_check.sh
#!/bin/bash
URL="http://localhost:8080/health"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
echo "$(date) - Status: $STATUS"
EOF
chmod +x $SCRIPTDIR/health_check.sh

##################################
### 7. LOG MANAGEMENT           ###
##################################
echo "[+] Log examples stored at $LOGDIR"

##################################
### 8. PERFORMANCE TOOLS        ###
##################################
apt install -y htop iotop

echo "==== LEVEL 3 — ADVANCED TASKS ===="

###########################################
### 9. SYSTEMD SERVICE FOR APPLICATION  ###
###########################################
echo "[+] Creating systemd service..."

cat << 'EOF' > /etc/systemd/system/myapp.service
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
Environment=JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable myapp

##################################
### 10. SSH HARDENING          ###
##################################
echo "[+] Hardening SSH..."

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config

systemctl restart sshd

##################################
### 12. UFW FIREWALL SETUP     ###
##################################
echo "[+] Enabling firewall rules..."
apt install -y ufw
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8080/tcp
ufw --force enable

#################################################
### 13. LOGROTATE FOR APPLICATION LOGS        ###
#################################################
echo "[+] Configuring logrotate..."

cat << 'EOF' > /etc/logrotate.d/myapp
/var/log/myapp/*.log {
    daily
    rotate 14
    compress
    missingok
    notifempty
    copytruncate
}
EOF

echo "==== SETUP COMPLETE SUCCESSFULLY ===="


---

## Prerequisites

- OS: Ubuntu 20.04+ / Debian
- You have `sudo` access.
- App user: `appuser`
- App name: `myapp`
- App directory: `/opt/myapp`
- Logs directory: `/var/log/myapp`

---

## Directory Structure

```bash
sudo mkdir -p /opt/myapp
sudo mkdir -p /var/log/myapp
sudo mkdir -p /opt/scripts
