#!/bin/sh

cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png

rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/

at now +1 minutes -f /root/1580-2022-m_os-auto/bin/update.sh
