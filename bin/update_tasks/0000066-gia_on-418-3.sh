#!/bin/sh

[ ! "`hostname | grep m1580-2-418-3`" ] && exit

[ ! "`cat /etc/X11/sddm/sddm.conf | grep teacher`" ] && exit

sed -i'.bak' -E -e 's,^Session.+,Session=plasma,' -e 's,^User.+,User=teacher,' /etc/X11/sddm/sddm.conf
reboot
