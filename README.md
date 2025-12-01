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

# 📦 FULL LINUX DEVOPS CONTENT  
(All procedures + commands in one file)

👉 [FULL_CONTENT.md](FULL_CONTENT.md)
