#!/bin/sh

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /tmp/ && wget -nc https://download.jetbrains.com/idea/ideaIC-2022.3.tar.gz && tar -xzf ideaIC-2022.3.tar.gz -C /opt || exit 1
