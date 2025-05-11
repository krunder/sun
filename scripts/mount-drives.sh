#!/bin/bash

mkdir -p /mnt/games && mkdir -p /mnt/nas
# umount /dev/nvme1n1p2 || /bin/true
sudo mount /dev/nvme1n1p2 /mnt/games -a -o noatime,nodev,nosuid,uid=1000,gid=1000
# umount /dev/sda2 || /bin/true
sudo mount /dev/sda2 /mnt/nas -a -o noatime,nodev,nosuid,uid=1000,gid=1000
#chown -R $USER:$USER /mnt
