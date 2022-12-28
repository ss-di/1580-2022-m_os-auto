#!/bin/sh

# exit

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /home/ && wget -nc https://sdo.1580.ru/some-files/wine-kompas_3d_lt.tbz && \
             wget -nc https://sdo.1580.ru/some-files/wine-kompas_3d_lt.tbz.md5 && \
             md5sum -c wine-kompas_3d_lt.tbz.md5 || (rm -f wine-kompas_3d_lt.tbz*; exit 1)

