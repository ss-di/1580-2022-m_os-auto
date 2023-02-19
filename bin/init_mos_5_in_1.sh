#!/bin/sh

if [[ $(whoami) == 'root' ]]
then
    studentpassw=$(kdialog --title="Настройка системы" --inputbox "Введите пароль ученика")
    teacherpassw=$(kdialog --title="Настройка системы" --inputbox "Введите пароль учителя")
    rootpassw=$(kdialog --title="Настройка системы" --inputbox "Введите пароль рута")

    myhostname=$(hostname)
    myhostname=$(kdialog --title="Настройка системы" --inputbox "Введите имя компьютера" $myhostname)
    echo $myhostname

    useradd teacher && gpasswd -a teacher wheel && chpasswd <<<"teacher:$teacherpassw"
    useradd student && chpasswd <<<"student:$studentpassw"

    chpasswd <<< "user:$rootpassw"
    chpasswd <<< "root:$rootpassw"

    if id student &>/dev/null
    then
        sed -i'.bak' -E -e 's,^Session.+,Session=plasma,' -e 's,^User.+,User=student,' /etc/X11/sddm/sddm.conf
    fi

    cd /root
    git clone https://github.com/ss-di/1580-2022-m_os-auto
    sh 1580-2022-m_os-auto/bin/install.sh


    pkexec bash -c 'rm -f /etc/machine-id && rm -f /var/lib/dbus/machine-id && dbus-uuidgen --ensure && systemd-machine-id-setup && hostnamectl     hostname '$myhostname' && reboot'

else
    echo 'Требуется запускать от суперпользователя'
fi
