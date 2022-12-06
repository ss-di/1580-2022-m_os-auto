#!/bin/sh

exec > /var/log/main-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

# планируем запуст через одну минуту (когда уже будет сеть)
at now +2 minutes -f /root/1580-2022-m_os-auto/bin/update.sh

# обои
#if [ "`hostname | grep m1580-2-418`" ] # для кабинета 2-419
#then
#    cp data/wallpapers/001-warning.jpg /usr/share/design/school/backgrounds/default.png
#
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
for task in bin/main_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

# восстанавливаем студента по умолчанию
rm -rf /home/student
tar xjvpf data/homes/home-student-empty.tbz -C /home/


# https://github.com/processing/processing4/releases/download/processing-1289-4.1.1/processing-4.1.1-linux-arm64.tgz
