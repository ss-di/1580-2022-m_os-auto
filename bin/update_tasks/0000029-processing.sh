#!/bin/sh

# exit

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /tmp/ && \
wget https://github.com/processing/processing4/releases/download/processing-1289-4.1.1/processing-4.1.1-linux-x64.tgz && \
cd /opt/ && \
tar xzpf /tmp/processing-4.1.1-linux-x64.tgz || exit 1
