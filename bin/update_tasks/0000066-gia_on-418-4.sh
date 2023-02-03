#!/bin/sh

[ ! "`hostname | grep m1580-2-418-4`" ] && exit

[ "`cat /etc/X11/sddm/sddm.conf | grep teacher`" ] && exit

sed -i'.bak' -E -e 's,^Session.+,Session=plasma,' -e 's,^User.+,User=teacher,' /etc/X11/sddm/sddm.conf

mkdir /home/teacher/.config/autostart
cp data/autostart/W10.desktop /home/teacher/.config/autostart/

reboot
