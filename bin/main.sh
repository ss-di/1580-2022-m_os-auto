#!/bin/sh

exec > /var/log/main-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

# планируем запуск через две минуту (когда уже будет сеть)
at now +2 minutes -f /root/1580-2022-m_os-auto/bin/update.sh

source /root/1580-2022-m_os-auto/bin/config.sh

set_default_wallpapers() {
    # ставим картинку
    cp $1 /usr/share/design/school/backgrounds/default.png
}

clear_student_home() {
    # backup
    BACKUP=/home/backup-student-from-`date +%Y_%m_%d-%H_%M_%S`
    mv /home/student $BACKUP
    chown root:teacher $BACKUP
    chmod 0750 $BACKUP

    # восстанавливаем студента по умолчанию
    rm -rf /home/student
    tar xjpf data/homes/home-student-empty.tbz -C /home/

    # в хромиуме по умолчанию страница sdo.1580.ru
    sed '5 s/yandex.ru/sdo.1580.ru/' -i /home/student/.config/chromium/Default/Preferences

    # для того, чтобы учитель мог писать в папку студента
    chmod 0770 /home/student

    # ссылка на processing-4.1.1
    ln -s /opt/processing-4.1.1/processing /home/student/Рабочий\ стол/processing

    # ссылка на IntelliJ IDEA
    ln -s /opt/idea-IC-223.7571.182/bin/idea.sh /home/student/Рабочий\ стол/IntelliJ_IDEA.sh

    # Компас 3D LT
    [ -f /home/wine-kompas_3d_lt.tbz ] && \
        cp data/KOMPASLT.sh /home/student/Рабочий\ стол/ && \
        tar xjpf /home/wine-kompas_3d_lt.tbz -C /home/student/ &
}

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

wallpaper="no"

host_in_and_not "$wallpaper_1580" "$wallpaper_1580_exclude"
if [ "$?" = "1" ]
then
    wallpapers="1580"
fi


host_in_and_not "$wallpaper_001" "$wallpaper_001_exclude"
if [ "$?" = "1" ]
then
    wallpapers="001"
fi

host_in_and_not "$student_clear" "$student_clear_exclude"
if [ "$?" = "1" ]
then
    clear_student_home
    wallpapers=$wallpapers"-warning"
fi

if [ "$wallpapers" != "no" ]
then
    set_default_wallpapers "data/wallpapers/""$wallpapers"".jpg"
fi
