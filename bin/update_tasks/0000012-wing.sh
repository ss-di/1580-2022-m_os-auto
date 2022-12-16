#!/bin/sh

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /tmp/ && wget -nc https://wingware.com/pub/wing-101/9.0.1.0/wing-101-9-9.0.1-0.x86_64.rpm && apt-get install wing-101-9-9.0.1-0.x86_64.rpm || exit 1
