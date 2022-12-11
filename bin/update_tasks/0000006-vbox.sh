#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает


if [ "`hostname | grep localhost`" ] # для не настроенных
then
    exit 1

elif [ "`hostname | grep p1580`" ] # для панелей
then
    apt-get -y install virtualbox && gpasswd -a teacher vboxusers || exit 1

elif [ "`hostname | grep m1580`" ] # для моноблоков
then
    apt-get -y install virtualbox && gpasswd -a student vboxusers && gpasswd -a teacher vboxusers || exit 1

else # для неведомых зверушек
    exit 1

fi

