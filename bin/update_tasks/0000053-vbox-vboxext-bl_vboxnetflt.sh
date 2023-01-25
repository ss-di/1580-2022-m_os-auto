#!/bin/sh

# установка VirtualBox
apt-get -y install virtualbox || exit 1

cd /tmp && \
wget -nc https://download.virtualbox.org/virtualbox/6.1.40/Oracle_VM_VirtualBox_Extension_Pack-6.1.40.vbox-extpack && \
wget -nc https://www.virtualbox.org/download/hashes/6.1.40/MD5SUMS && \
cat MD5SUMS | grep Oracle_VM_VirtualBox_Extension_Pack-6.1.40.vbox-extpack | md5sum -c && \
(sleep 3 && echo y) | VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.40.vbox-extpack || \\
(rm -f Oracle_VM_VirtualBox_Extension_Pack-6.1.40.vbox-extpack MD5SUMS; exit 1)

# блокирока сетевого моста
echo blacklist vboxnetflt > /etc/modprobe.d/blacklist-vboxnetflt.conf || exit 1

# даем права на использование
gpasswd -a student vboxusers
gpasswd -a teacher vboxusers
