#!/bin/sh

exit

exec >> /var/log/main-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

gpasswd -d student wheel # на всякий случай убрать права админа у студента. потом надо убрать команду
chmod 0750 /usr/bin/veyon-master # отобрать права на запуск у всех кроме владельца и группы
chmod 0750 /usr/bin/veyon-configurator # отобрать права на запуск у всех кроме владельца и группы
chown root:wheel /usr/bin/veyon-master # установить нужную группы для допуска teacher
chown root:wheel /usr/bin/veyon-configurator # установить нужную группы для допуска teacher
