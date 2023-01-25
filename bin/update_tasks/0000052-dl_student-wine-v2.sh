#!/bin/sh

cd /home/ && wget -nc https://sdo.1580.ru/some-files/student-wine-v2.tbz && \
             wget -nc https://sdo.1580.ru/some-files/student-wine-v2.tbz.md5 && \
             md5sum -c student-wine-v2.tbz.md5 || (rm -f student-wine-v2.tbz*; exit 1)

