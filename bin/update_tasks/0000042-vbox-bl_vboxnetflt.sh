#!/bin/sh

# установка VirtualBox
apt-get -y install virtualbox || exit 1

# блокирока сетевого моста
echo blacklist vboxnetflt > /etc/modprobe.d/blacklist-vboxnetflt.conf || exit 1

# даем права на использование
gpasswd -a student vboxusers
gpasswd -a teacher vboxusers
