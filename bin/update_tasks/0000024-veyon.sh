#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

apt-get -y install veyon && chmod 0750 /usr/bin/veyon-master && chmod 0750 /usr/bin/veyon-configurator && chown root:wheel /usr/bin/veyon-master && chown root:wheel /usr/bin/veyon-configurator || exit 1
