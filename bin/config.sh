# m1580 - моноблоки
# n1580 - ноутбуки
# p1580 - панели
# x1580, m1580-0 - для тестов

# Очищать папку студента для:
student_clear="m1580"
# Очищать папку студента кроме:
student_clear_exclude="n1580 p1580"

# Включать черный список для:
inet_filter="m1580 x1580"
# Включать черный список кроме:
inet_filter_exclude=""

# Включать белый список для:
inet_white="x1580"
# Включать белый список кроме:
inet_white_exclude=""

# Включать белый список для:
wallpaper_001="m1580-2-419"
# Включать белый список кроме:
wallpaper_001_exclude=""

# Установить правильные обои для:
wallpaper_1580="1580"
# Установить правильные обои кроме:
wallpaper_1580_exclude="m1580-2-419 m1580-3"

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
