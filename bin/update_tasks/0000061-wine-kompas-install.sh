#!/bin/sh

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y update || exit 1
apt-get -y install i586-wine || exit 1
apt-get -y install winetricks || exit 1

#установка win32 дополнительных библиотек
# эквивалент команды epm  , которая на момент написания в МОС не работает, только в altlinux
LIST=""
for i in glibc-nss glibc-gconv-modules sssd-client vulkan-amdgpu libvulkan1 $(epmqp --short libnss | grep "^libnss-")  $(epmqp --short xorg-dri | grep "^xorg-dri-")
do
    epm --auto --quiet install $i && LIST="$LIST i586-$i" || exit 1
done
epm --auto install $LIST || exit 1
