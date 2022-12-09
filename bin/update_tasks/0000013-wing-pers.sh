#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /tmp/ && wget https://wingware.com/pub/wing-personal/9.0.1.0/wing-personal9-9.0.1-0.x86_64.rpm && apt-get install wing-personal9-9.0.1-0.x86_64.rpm && dpkg -l | grep " wing-personal " || exit 1
