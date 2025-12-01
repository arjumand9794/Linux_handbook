# Permissions Setup

```bash
sudo mkdir -p /opt/myapp /var/log/myapp /opt/scripts
sudo chown -R appuser:devteam /opt/myapp /var/log/myapp
sudo chmod -R 770 /opt/myapp
sudo chmod g+s /opt/myapp
```
