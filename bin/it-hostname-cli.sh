#!/bin/sh

if [[ $(whoami) == 'root' ]]
then

    myhostname=$(hostname)

    mylab=$1
    mynum=$2
    myhostname = "custom-2-it$mylab-$mynum"

    echo $myhostname

    pkexec bash -c 'rm -f /etc/machine-id && rm -f /var/lib/dbus/machine-id && dbus-uuidgen --ensure && systemd-machine-id-setup && hostnamectl     hostname '$myhostname' && reboot'

else
    echo 'Требуется запускать от суперпользователя'
fi
