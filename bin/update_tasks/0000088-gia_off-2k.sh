#!/bin/sh

[ ! "`hostname | grep m1580-2`" ] && exit

# [ "`cat /etc/X11/sddm/sddm.conf | grep student`" ] && exit

[ ! -f "/home/teacher/.config/autostart/W10.desktop" ] && exit

sed -i'.bak' -E -e 's,^Session.+,Session=plasma,' -e 's,^User.+,User=student,' /etc/X11/sddm/sddm.conf
rm -f /home/teacher/.config/autostart/W10.desktop
rm -f /home/teacher/.config/powermanagementprofilesrc

shutdown -h now
