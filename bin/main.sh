#!/bin/sh

exec > /var/log/main-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

# планируем запуск через две минуту (когда уже будет сеть)
at now +2 minutes -f /root/1580-2022-m_os-auto/bin/update.sh

#разовые задачи
for task in bin/main_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

DATE=`date +%Y_%m_%d`

#удаляем старые бэкапы
for FILE in /home/backup-*
do
    [ ! "`echo $FILE | grep $DATE`" ] && rm -rf $FILE
done


if [ "`hostname | grep localhost`" ] # для не настроенных
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep n1580-2-lob`" ] # для бесчеловечных экспериментов
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep n1580`" ] # для ноутов
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep p1580-2-418`" ] # для панели в 418
then
    # ставим картинку
    cp data/wallpapers/1580.jpg /usr/share/design/school/backgrounds/default.png

elif [ "`hostname | grep p1580`" ] # для остальных панелей
then
    # ставим картинку
    cp data/wallpapers/001.jpg /usr/share/design/school/backgrounds/default.png

elif [ "`hostname | grep m1580-2-419`" ] # для моноблоков 2-419
then

    # ставим картинку
    cp data/wallpapers/001-warning.jpg /usr/share/design/school/backgrounds/default.png
    # cp data/wallpapers/001.jpg /usr/share/design/school/backgrounds/default.png

    # backup
    BACKUP=/home/backup-student-from-`date +%Y_%m_%d-%H_%M_%S`
    mv /home/student $BACKUP
    chown root:teacher $BACKUP
    chmod 0750 $BACKUP

    # восстанавливаем студента по умолчанию
    # rm -rf /home/student
    tar xjvpf data/homes/home-student-empty.tbz -C /home/

elif [ "`hostname | grep m1580-3`" ] # для моноблоков 3-го корпуса
then

    # ставим картинку
    cp data/wallpapers/001-warning.jpg /usr/share/design/school/backgrounds/default.png
    # cp data/wallpapers/001.jpg /usr/share/design/school/backgrounds/default.png

    # backup
    BACKUP=/home/backup-student-from-`date +%Y_%m_%d-%H_%M_%S`
    mv /home/student $BACKUP
    chown root:teacher $BACKUP
    chmod 0750 $BACKUP

    # восстанавливаем студента по умолчанию
    # rm -rf /home/student
    tar xjvpf data/homes/home-student-empty.tbz -C /home/

elif [ "`hostname | grep m1580`" ] # для прочих моноблоков
then

    # ставим картинку
    cp data/wallpapers/1580-warning.jpg /usr/share/design/school/backgrounds/default.png
    # cp data/wallpapers/1580.jpg /usr/share/design/school/backgrounds/default.png

    # backup
    BACKUP=/home/backup-student-from-`date +%Y_%m_%d-%H_%M_%S`
    mv /home/student $BACKUP
    chown root:teacher $BACKUP
    chmod 0750 $BACKUP

    # восстанавливаем студента по умолчанию
    # rm -rf /home/student
    tar xjvpf data/homes/home-student-empty.tbz -C /home/

else # для неведомых зверушек
    # ничего не делаем
    echo do nothing

fi

# https://github.com/processing/processing4/releases/download/processing-1289-4.1.1/processing-4.1.1-linux-arm64.tgz
