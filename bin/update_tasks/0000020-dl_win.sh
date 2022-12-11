#!/bin/sh

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

if [ "`hostname | grep localhost`" ] # для не настроенных
then
    exit -1

elif [ "`hostname | grep p1580`" ] # для панелей
then
    rm -rf /home/Windows_10.ova* # удалим в 419 и не будем ставить

elif [ "`hostname | grep m1580`" ] # для моноблоков
then

    cd /home/ && wget -c https://sdo.1580.ru/some-files/Windows_10.ova || exit 1

else # для неведомых зверушек
    exit 1
fi

