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
