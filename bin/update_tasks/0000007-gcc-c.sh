#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y install gcc-c++ && dpkg -l | grep " gcc-c++ " || exit 1

