#!/bin/sh
echo 2

if [ "`hostname | grep 418`" ]
then
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png

elif [ "`hostname | grep 419`" ]
then
    cp data/wallpapers/000.jpg /usr/share/design/school/backgrounds/default.png

else
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png
fi

#exit

rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/

at now +1 minutes -f /root/1580-2022-m_os-auto/bin/update.sh
