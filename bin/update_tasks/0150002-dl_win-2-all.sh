#!/bin/sh

exit # отключим

[ ! "`hostname | grep m1580-2`" ] && exit

[ "`hostname | grep m1580-2-427`" ] && exit # не надо винду в 427

cd /home/ && wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/Windows_10.ova && \
             wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/Windows_10.ova.md5 && \
             md5sum -c Windows_10.ova.md5 || (rm -f Windows_10.ova*; exit 1)
