#!/bin/sh

exit

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

if [ -f "/home/Windows_10.ova" ]
then

    rm -f /home/Windows_10.ova*

fi
