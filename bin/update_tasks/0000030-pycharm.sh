#!/bin/sh

# exit

# exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

#echo $path

epm ei && epm play pycharm || exit 1
