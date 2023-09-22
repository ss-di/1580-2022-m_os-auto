#!/bin/sh

[ ! "`hostname | grep m1580-1`" ] && exit

cd /home/ && wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/Windows_10.ova && \
             wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/Windows_10.ova.md5 && \
             md5sum -c Windows_10.ova.md5 || (rm -f Windows_10.ova*; exit 1)
