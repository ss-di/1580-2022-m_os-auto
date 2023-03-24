#!/bin/sh

if [[ $(whoami) == 'root' ]]
then

    myhostname=$(hostname)

    mylab=$(kdialog --title="Настройка системы" --inputbox "Введите номер лаборатории (1, 2, 3, 4)")
    mynum=$(kdialog --title="Настройка системы" --inputbox "Введите номер компьютера (1, 2, ...)")
    myhostname = "custom-2-it$mylab-$mynum"

    echo $myhostname

    pkexec bash -c 'rm -f /etc/machine-id && rm -f /var/lib/dbus/machine-id && dbus-uuidgen --ensure && systemd-machine-id-setup && hostnamectl     hostname '$myhostname' && reboot'

else
    echo 'Требуется запускать от суперпользователя'
fi
