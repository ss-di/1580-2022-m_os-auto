#!/bin/sh

FILE=student-wine-pabc.tbz

cd /home/ && wget -nc https://sdo.1580.ru/some-files/$FILE && \
             wget -nc https://sdo.1580.ru/some-files/$FILE.md5 && \
             md5sum -c $FILE.md5 || (rm -f $FILE*; exit 1)

