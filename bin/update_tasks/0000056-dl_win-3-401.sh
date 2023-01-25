#!/bin/sh

[ ! "`hostname | grep m1580-3-401`" ] && exit

cd /home/ && wget -nc https://sdo.1580.ru/some-files/Windows_10.ova && \
             wget -nc https://sdo.1580.ru/some-files/Windows_10.ova.md5 && \
             md5sum -c Windows_10.ova.md5 || (rm -f Windows_10.ova*; exit 1)
