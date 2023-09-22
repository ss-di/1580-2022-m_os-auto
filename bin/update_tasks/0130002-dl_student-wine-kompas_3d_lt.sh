#!/bin/sh

FILE=student-wine-kompas_3d_lt.tbz

cd /home/ && wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/$FILE && \
             wget -nc https://bf726e13342a.hosting.myjino.ru/some-files/$FILE.md5 && \
             md5sum -c $FILE.md5 || (rm -f $FILE*; exit 1)

