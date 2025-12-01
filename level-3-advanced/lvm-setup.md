# LVM Setup

```bash
pvcreate /dev/sdb
vgcreate vg_data /dev/sdb
lvcreate -L 50G -n lv_data vg_data
mkfs.ext4 /dev/vg_data/lv_data
mount /dev/vg_data/lv_data /data
```
