#!/bin/sh

exit

exec >> /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

if [ -f "/home/Windows_10.ova" ]
then

    if [ "`ls -l /home/Windows_10.ova | grep 18052708352`" ]
    then
        # ничего не делаем
        echo do nothing

    else
        rm -rf /home/Windows_10.ova
        rm -rf /root/1580-2022-m_os-auto/bin/update_tasks/0000020-dl_win.sh.done
    fi

else # для неведомых зверушек
    # ничего не делаем
    echo do nothing

fi

