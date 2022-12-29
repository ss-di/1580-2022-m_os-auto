#!/bin/sh

# обновление системы от разработчиков
apt-get update && apt-get -y dist-upgrade && update-kernel -f && apt-get clean

#разовые задачи
for task in bin/update_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

inet_filter(){
    for i in `cat data/white_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
    done

    iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    iptables -A OUTPUT -d 87.250.251.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 87.250.250.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 77.88.21.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 93.158.134.119 -j ACCEPT # разрешаем mc.yandex.ru

    iptables -A OUTPUT -d 88.212.201.198 -j ACCEPT # разрешаем counter.yadro.ru
    iptables -A OUTPUT -d 88.212.201.204 -j ACCEPT # разрешаем counter.yadro.ru
    iptables -A OUTPUT -d 88.212.202.52 -j ACCEPT # разрешаем counter.yadro.ru

    iptables -A OUTPUT -d 88.212.202.50 -j ACCEPT # разрешаем www.liveinternet.ru

    for i in `cat data/black_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
    done
}

inet_white_only(){
    # iptables -A OUTPUT -p tcp --dport 80 -j LOG # блокируем исходящий http
    # iptables -A OUTPUT -p tcp --dport 443 -j LOG # блокируем исходящий https

    iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
    iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https
}

if [ "`hostname | grep localhost`" ] # для не настроенных
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep x1580`" ] # для бесчеловечных экспериментов
then
    inet_filter
    # inet_white_only

elif [ "`hostname | grep n1580`" ] # для ноутов
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep p1580`" ] # для панелей
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep m1580-2-418`" ] # для моноблоков 2-418
then
    inet_filter
    inet_white_only

elif [ "`hostname | grep m1580`" ] # для моноблоков
then
    inet_filter
    # inet_white_only

else # для неведомых зверушек
    # ничего не делаем
    echo do nothing
fi
