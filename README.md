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


# Linux_handbook
Linux_commands_execution (basics to advanced)

---

# Linux DevOps Roadmap – App Server Setup

## 📘 Level 1 – Basic (Foundational Skills)

### ✔ Users, Groups, Permissions, Packages, System Info

- 👉 [Users & Groups Setup](level-1-basic/users-and-groups.md)
- 👉 [Permissions Setup](level-1-basic/permissions.md)
- 👉 [Package Installation (Git, Nginx, Java)](level-1-basic/packages-installation.md)
- 👉 [System Information Commands](level-1-basic/system-info.md)

---

## 📙 Level 2 – Intermediate (Daily DevOps Tasks)

### ✔ Cron, Shell Scripts, Logs, Monitoring

- 👉 [Backup Automation (Cron)](level-2-intermediate/backup-cron.sh)
- 👉 [Log Cleanup Script](level-2-intermediate/log-cleanup.sh)
- 👉 [Health Check Script](level-2-intermediate/health-check.sh)
- 👉 [Service Restart Script](level-2-intermediate/service-restart.sh)
- 👉 [Log Monitoring Commands](level-2-intermediate/logs-monitoring.md)

---

## 📗 Level 3 – Advanced (Production-Ready Linux Admin)

### ✔ Systemd, SSH Security, LVM, Firewall, Logrotate

- 👉 [Custom systemd Service](level-3-advanced/myapp.service)
- 👉 [SSH Hardening Guide](level-3-advanced/ssh-hardening.md)
- 👉 [LVM Setup for Storage Scaling](level-3-advanced/lvm-setup.md)
- 👉 [Firewall Rules](level-3-advanced/firewall-rules.md)
- 👉 [Logrotate Configuration](level-3-advanced/logrotate.conf)

---

What is Linux? (Simple Explanation)

Linux is an open-source operating system used widely in:

✔ Servers
✔ Cloud (AWS, Azure, GCP)
✔ DevOps pipelines
✔ Containers (Docker, Kubernetes)
✔ Security & Networking
✔ High-performance computing

Unlike Windows, Linux gives you:

Full control through commands

Better security

Faster performance

No licensing cost

Massive community support

That’s why 90% of cloud servers run Linux.

⭐ Why Linux is IMPORTANT for DevOps & Cloud
🔹 1. Most servers run Linux

AWS EC2, Kubernetes nodes, Jenkins servers — ALL run on Linux.

🔹 2. Automation depends on Linux commands

Bash scripting, cron jobs, service restart automation, deployments.

🔹 3. DevOps tools run natively on Linux

Docker, Kubernetes, Jenkins, GitLab, Ansible, Terraform → all are made for Linux.

🔹 4. Better security & reliability

Linux is stable for production workloads.

🔹 5. Full customization

You can tune memory, CPU, services, firewall, logs — EVERYTHING.

🔥 Top 20 Most Used Linux Commands (DevOps-Focused)

These are THE MOST IMPORTANT commands you should know.

🔵 1. System Information Commands
Command	Purpose
uname -a	Kernel, OS details
lsb_release -a	Linux distribution info
hostnamectl	Hostname + OS info
lscpu	CPU info
free -h	Memory (RAM) usage
df -h	Disk usage
lsblk	Storage devices (HDD/SSD)
uptime	System uptime & load
🟢 2. File & Directory Commands
Command	Purpose
ls -l	List with details
cd	Change directory
mkdir folder	Create directory
rm -rf folder	Delete folder
cp file1 file2	Copy file
mv old new	Move/Rename
touch file	Create file
🔥 3. File Content Viewing
Command	Purpose
cat file	Show full file
less file	View large files
tail -f logfile.log	Live log monitoring
grep "error" file	Search inside file
🟣 4. Permission & Ownership
Command	Purpose
chmod 770 file	Change permissions
chown user:group file	Change ownership
id user	Show user details
groups user	Show user groups
🟠 5. User & Group Commands
Command	Purpose
useradd user	Add user
passwd user	Set password
groupadd group	Create group
usermod -aG group user	Add user to group
🔵 6. Networking Commands
Command	Purpose
ip a	Show IP addresses
ping google.com	Check connectivity
ss -tulnp	Show open ports
curl URL	Check web services
🔴 7. Service Management (systemd)
Command	Purpose
systemctl start nginx	Start service
systemctl stop nginx	Stop service
systemctl restart nginx	Restart
systemctl status nginx	Check status
journalctl -u nginx -f	Live logs





#!/bin/bash
sudo groupadd devteam
for user in dev1 dev2 dev3; do
    sudo useradd -m -G devteam $user
    echo "User $user created and added to devteam"
done
:two: set_permissions.sh
#!/bin/bash
sudo mkdir -p /opt/devproject
sudo chown :devteam /opt/devproject
sudo chmod 770 /opt/devproject
echo "Permissions set for /opt/devproject"
:three: install_packages.sh
#!/bin/bash
sudo yum update -y
sudo yum install -y git nginx java-17-amazon-corretto
sudo systemctl enable nginx
sudo systemctl start nginx
echo "Git, Nginx & Java installed successfully on Amazon Linux"
:four: system_info.sh
#!/bin/bash
echo "CPU Info:"; lscpu
echo "Memory Info:"; free -h
echo "Disk Info:"; df -h
:large_yellow_square: Folder: intermediate
intermediate
:one: automate_backup.sh
#!/bin/bash
SOURCE=/opt/devproject
BACKUP=/backup/devproject_$(date +%F).tar.gz
sudo tar -czvf $BACKUP $SOURCE
echo "Backup stored at $BACKUP"
(Add to cron: 0 2 * * * /path/automate_backup.sh)
:two: log_cleanup.sh
#!/bin/bash
find /var/log -type f -mtime +7 -exec rm -f {} \;
echo "Old logs cleared"
:three: check_service_status.sh
#!/bin/bash
SERVICES="nginx ssh"
for svc in $SERVICES; do
    sudo systemctl is-active --quiet $svc && \
    echo "$svc is running" || \
    echo "$svc is down"
done
:four: performance_monitor.sh
#!/bin/bash
echo "---CPU Load---"; top -b -n1 | head -5
echo "---Disk Space---"; df -h
echo "---Memory---"; free -h
:large_red_square: Folder: advanced
advanced
:one: custom_systemd_service.sh
#!/bin/bash
cat <<EOF | sudo tee /etc/systemd/system/myapp.service
[Unit]
Description=My Custom App Service

[Service]
ExecStart=/usr/bin/python3 /opt/myapp/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp
:two: ssh_hardening.sh
#!/bin/bash
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "SSH Hardening Applied: Password login disabled"
:three: lvm_setup.sh
#!/bin/bash
sudo pvcreate /dev/sdb
sudo vgcreate myvg /dev/sdb
sudo lvcreate -n mylv -L 5G myvg
sudo mkfs.ext4 /dev/myvg/mylv
sudo mkdir /mnt/lvmdata
sudo mount /dev/myvg/mylv /mnt/lvmdata
echo "LVM setup completed"
:four: firewall_setup.sh
#!/bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw logging on
echo "Enabling UFW firewall..."
sudo ufw --force enable

echo "Firewall configured: SSH, HTTP, HTTPS allowed"
sudo ufw status verbose
:five: logrotate_config.sh
#!/bin/bash
cat <<EOF | sudo tee /etc/logrotate.d/myapp
/var/log/myapp.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOF
echo "Logrotate config added"

# 📦 FULL LINUX DEVOPS CONTENT  
(All procedures + commands in one file)

👉 [FULL_CONTENT.md](FULL_CONTENT.md)
