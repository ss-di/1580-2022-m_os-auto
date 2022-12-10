#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y install virtualbox && gpasswd -a student vboxusers && gpasswd -a teacher vboxusers || exit 1
