#!/bin/sh

exit

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y install pascalabcnet && dpkg -l | grep pascalabcnet || exit 1
