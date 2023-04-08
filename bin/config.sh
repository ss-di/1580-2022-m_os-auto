# m1580 - моноблоки
# n1580 - ноутбуки
# p1580 - панели
# x1580, m1580-0 - для тестов

# Очищать папку студента для:
student_clear="m1580 custom-2-it n1580-2-free n1580-2-lobachev"
# Очищать папку студента кроме:
student_clear_exclude=""

# Включать черный список для:
inet_filter="m1580 custom-2-it n1580-2-free n1580-2-lobachev x1580"
# Включать черный список кроме:
inet_filter_exclude=""

# Включать белый список для:
inet_white="x1580"
# Включать белый список кроме:
inet_white_exclude=""

# Выключить интернет:
inet_off=""
# Выключить интернет кроме:
inet_off_exclude=""

# Установить правильные обои для:
wallpaper_1580="m1580 n1580-2-it n1580-2-free n1580-2-lobachev"
# Установить правильные обои кроме:
wallpaper_1580_exclude=""

# Неправильные, но красивые обои для:
wallpaper_001="m1580-2-419 m1580-3"
# Неправильные, но красивые обои кроме:
wallpaper_001_exclude=""


#################

host_in() {
    for host in $1
    do
        [ `hostname | grep $host` ] && return 1
    done
    return 0
}

host_in_and_not() {
    host_in "$1"
    [ "$?" = 0 ] && return 0

    host_in "$2"
    [ "$?" = 1 ] && return 0

    return 1
}
