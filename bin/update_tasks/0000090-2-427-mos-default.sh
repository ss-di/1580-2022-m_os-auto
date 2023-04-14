#!/bin/sh

[ ! "`hostname | grep m1580-2-427`" ] && exit

sed -i "s/GRUB_DEFAULT='saved'/GRUB_DEFAULT='MOS 1.0 School'/" /etc/sysconfig/grub2
grub-mkconfig > /boot/grub/grub.cfg
