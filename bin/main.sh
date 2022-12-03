#!/bin/sh

exec > /var/log/main-sh.log 2>&1

if [ "`hostname | grep 418`" ]
then
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png

elif [ "`hostname | grep 419`" ]
then
    cp data/wallpapers/001.jpg /usr/share/design/school/backgrounds/default.png

else
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png

fi

gpasswd -d student wheel
chmod 0750 /usr/bin/veyon-master
chmod 0750 /usr/bin/veyon-configurator
chown root:wheel /usr/bin/veyon-master
chown root:wheel /usr/bin/veyon-configurator

rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/

at now +1 minutes -f /root/1580-2022-m_os-auto/bin/update.sh
