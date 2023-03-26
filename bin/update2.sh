#!/bin/sh

source /root/1580-2022-m_os-auto/bin/config.sh

inet_filter(){
    # iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT # ответы на исходящие пакеты

    iptables -A OUTPUT -p udp --dport 53 -j ACCEPT # DNS

    #iptables -A OUTPUT -d 194.58.88.173 -j ACCEPT # olympiads.ru - для региона
    #iptables -A OUTPUT -d 84.201.160.168 -j ACCEPT # ejudge.msk.ru - для региона

    iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    iptables -A OUTPUT -d 87.250.251.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 87.250.250.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 77.88.21.119 -j ACCEPT # разрешаем mc.yandex.ru
    iptables -A OUTPUT -d 93.158.134.119 -j ACCEPT # разрешаем mc.yandex.ru

    iptables -A OUTPUT -d 88.212.201.198 -j ACCEPT # разрешаем counter.yadro.ru
    iptables -A OUTPUT -d 88.212.201.204 -j ACCEPT # разрешаем counter.yadro.ru
    iptables -A OUTPUT -d 88.212.202.52 -j ACCEPT # разрешаем counter.yadro.ru

    iptables -A OUTPUT -d 88.212.202.50 -j ACCEPT # разрешаем www.liveinternet.ru


    for i in `cat data/white_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
    done

    for i in `cat data/black_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
    done
}

inet_white_only(){
    # iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
    # iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https
    iptables -P OUTPUT DROP # блокируем всё исходящее, кроме разрешенного
}

inet_off(){
    iptables -I OUTPUT 1 -j DROP # блокируем исходящий трафик
}

#разовые задачи
for task in bin/update_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

host_in_and_not "$inet_filter" "$inet_filter_exclude"
if [ "$?" = "1" ]
then
    inet_filter
fi

host_in_and_not "$inet_white" "$inet_white_exclude"
if [ "$?" = "1" ]
then
    inet_white_only
fi

host_in_and_not "$inet_off" "$inet_off_exclude"
if [ "$?" = "1" ]
then
    inet_off
fi
