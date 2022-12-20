#!/bin/sh

exec > /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /root/1580-2022-m_os-auto/
git pull || (at now +10 minutes -f /root/1580-2022-m_os-auto/bin/update.sh; exit)

sh /root/1580-2022-m_os-auto/bin/update2.sh
