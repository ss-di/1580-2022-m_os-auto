#!/bin/sh

sed -i'.bak' -E -e 's,^Session.+,Session=plasma,' -e 's,^User.+,User=student,' /etc/X11/sddm/sddm.conf
