!/bin/sh

if [[ $(whoami) == 'root' ]]
then

    myhostname=$(hostname)

    myhostname=$1

    echo $myhostname

    pkexec bash -c 'rm -f /etc/machine-id && rm -f /var/lib/dbus/machine-id && dbus-uuidgen --ensure && systemd-machine-id-setup && hostnamectl hostname '$myhostname' && reboot'

else
    echo 'Требуется запускать от суперпользователя'
fi
