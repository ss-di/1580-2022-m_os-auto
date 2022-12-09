#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y install java-17-openjdk-devel && dpkg -l | grep " java-17-openjdk-devel " || exit 1

