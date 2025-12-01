# Linux_handbook
Linux_commands _execution (basics to advanced)
# Linux DevOps Roadmap – App Server Setup

Scenario: You are a DevOps engineer automating Linux server setup for a new application.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Level 1 – Basic (Foundational Skills)](#level-1--basic-foundational-skills)
  - [1. Users and Groups](#1-users-and-groups)
  - [2. Permissions for Project Directories](#2-permissions-for-project-directories)
  - [3. Install Required Packages](#3-install-required-packages)
  - [4. Check System Info](#4-check-system-info)
- [Level 2 – Intermediate (Daily DevOps Tasks)](#level-2--intermediate-daily-devops-tasks)
  - [5. Automate Backups with Cron](#5-automate-backups-with-cron)
  - [6. Shell Scripts (Cleanup, Restart, Health Checks)](#6-shell-scripts-cleanup-restart-health-checks)
  - [7. Manage Logs under /var/log](#7-manage-logs-under-varlog)
  - [8. Monitor System Performance](#8-monitor-system-performance)
- [Level 3 – Advanced (Production-Ready Linux Admin)](#level-3--advanced-production-ready-linux-admin)
  - [9. Create Custom systemd Service](#9-create-custom-systemd-service)
  - [10. SSH Hardening](#10-ssh-hardening)
  - [11. LVM Setup for Storage Scaling](#11-lvm-setup-for-storage-scaling)
  - [12. Configure Firewall Rules](#12-configure-firewall-rules)
  - [13. Implement logrotate for App Logs](#13-implement-logrotate-for-app-logs)

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
