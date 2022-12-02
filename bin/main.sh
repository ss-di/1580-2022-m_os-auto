#!/bin/sh

cp data/wallpapers/1580-warning.jpg /usr/local/share/1580.jpg

rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/

echo "[Wallpapers]" > /home/student/.config/plasmarc
echo "usersWallpapers=/usr/local/share/1580.jpg" >> home/student/.config/plasmarc

at now +1 minutes -f /root/1580-2022-m_os-auto/bin/update.sh
