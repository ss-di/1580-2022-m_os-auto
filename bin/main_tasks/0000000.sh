#!/bin/sh

exit

exec > /var/log/main-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

# обои
if [ "`hostname | grep m1580-2-419`" ] # для кабинета 2-419
then
    cp data/wallpapers/001-warning.jpg /usr/share/design/school/backgrounds/default.png

elif [ "`hostname | grep m1580-3`" ] # для 3-го корпуса
then
    cp data/wallpapers/001-warning.jpg /usr/share/design/school/backgrounds/default.png

else
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png

fi

#разовые задачи
[ ! -f flags ] && mkdir flags # если нет директории отметок - создаем директорию



# по возможности реализовать в виде разовой команды. постоянно применять не трубуется
gpasswd -d student wheel # на всякий случай убрать права админа у студента. потом надо убрать команду
chmod 0750 /usr/bin/veyon-master # отобрать права на запуск у всех кроме владельца и группы
chmod 0750 /usr/bin/veyon-configurator # отобрать права на запуск у всех кроме владельца и группы
chown root:wheel /usr/bin/veyon-master # установить нужную группы для допуска teacher
chown root:wheel /usr/bin/veyon-configurator # установить нужную группы для допуска teacher

# восстанавливаем студента по умолчанию
rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/

# планируем запуст через одну минуту (когда уже будет сеть)
at now +1 minutes -f /root/1580-2022-m_os-auto/bin/update.sh

