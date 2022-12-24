#!/bin/sh

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

gpasswd -a teacher student # добавляем учителя в группу студента
