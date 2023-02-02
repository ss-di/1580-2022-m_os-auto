#!/bin/sh

[ ! "`hostname | grep m1580-2`" ] && exit # если не 2-й корпус

    # настройки кнопок и автовыключения для ЕГЭ/ОГЭ
    cp data/config/powermanagementprofilesrc-teacher-gia /home/teacher/.config/powermanagementprofilesrc || exit 1
