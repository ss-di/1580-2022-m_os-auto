#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /home/ && wget -c https://sdo.1580.ru/some-files/Windows_10.ova || exit 1
