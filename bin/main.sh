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

    # для того, чтобы учитель мог писать в папку студента
    chmod 0770 /home/student

    # в хромиуме по умолчанию страница sdo.1580.ru
    sed '5 s/yandex.ru/sdo.1580.ru/' -i /home/student/.config/chromium/Default/Preferences

    # запуск Chromium в режиме инкогнито по умолчанию
    #echo "export CHROMIUM_USER_FLAGS=\"--incognito\"" >> /home/student/.bash_profile

    # автозапуск Chromium
    mkdir /home/student/.config/autostart
    cp data/autostart/chromium.desktop /home/student/.config/autostart/ || echo error chromium.desktop
    # другая ссылка для 1-2 корпусов
    [ "`hostname | grep m1580-1`" ] && cp data/autostart/alt-chromium.desktop /home/student/.config/autostart/chromium.desktop
    [ "`hostname | grep m1580-1`" ] && cp data/autostart/alt-chromium.desktop /home/student/.config/autostart/chromium.desktop
    [ "`hostname | grep m1580-0`" ] && cp data/autostart/alt-chromium.desktop /home/student/.config/autostart/chromium.desktop

    # настройки кнопок и автовыключения
    cp data/config/powermanagementprofilesrc /home/student/.config/  || echo error powermanagementprofilesrc

    # настройки приложений по умолчанию
    cp data/config/mimeapps.list /home/student/.config/ || echo error mimeapps.list

    # ссылка на processing-4.1.1
    ln -s /opt/processing-4.1.1/processing /home/student/Рабочий\ стол/processing

    # ссылка на IntelliJ IDEA
    ln -s /opt/idea-IC-223.7571.182/bin/idea.sh /home/student/Рабочий\ стол/IntelliJ_IDEA.sh

    # PascalABC
    [ -f /home/student-wine-pabc.tbz ] && cp data/PascalABC.sh /home/student/Рабочий\ стол/

    # Компас 3D LT
    [ -f /home/student-wine-kompas_3d_lt.tbz ] && cp cp data/KOMPASLT.sh /home/student/Рабочий\ стол/

    # Windows 10 VM
    [ -f /home/Windows_10.ova ] && cp data/Windows10vm.sh /home/student/Рабочий\ стол/

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

if [ "$wallpapers" ] && [ "$wallpapers" != "-warning" ]
then
    set_default_wallpapers "data/wallpapers/""$wallpapers"".jpg"
fi
