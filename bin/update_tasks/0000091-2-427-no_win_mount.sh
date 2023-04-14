#!/bin/sh

[ ! "`hostname | grep m1580-2-427`" ] && exit

cp /etc/fstab /etc/fstab.bak
cat /etc/fstab.bak | grep -v mnt > /etc/fstab
rm -f /etc/fstab.bak
