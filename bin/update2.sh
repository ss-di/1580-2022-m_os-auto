#!/bin/sh

# обновление системы от разработчиков
apt-get update && apt-get -y dist-upgrade && update-kernel -f && apt-get clean

#разовые задачи
for task in bin/update_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

if [ "`hostname | grep localhost`" ] # для не настроенных
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep x1580`" ] # для бесчеловечных экспериментов
then
    # ничего не делаем
#    echo do nothing
    # iptables
    for i in `cat data/white_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
    done

    # iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    for i in `cat data/black_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
    done

    #iptables -A INPUT -p tcp --dport 22 -j DROP # блокируем входящий ssh

    iptables -A OUTPUT -p tcp --dport 80 -j LOG # блокируем исходящий http
    iptables -A OUTPUT -p tcp --dport 443 -j LOG # блокируем исходящий https
    iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
    iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https


elif [ "`hostname | grep n1580`" ] # для ноутов
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep p1580`" ] # для панелей
then
    # ничего не делаем
    echo do nothing

elif [ "`hostname | grep m1580-3-320`" ] || [ "`hostname | grep m1580-3-418`" ] # для моноблоков 3-320 и 3-418
then

    # iptables
    for i in `cat data/white_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
    done

    iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    for i in `cat data/black_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
    done

    #iptables -A INPUT -p tcp --dport 22 -j DROP # блокируем входящий ssh

    # iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
    # iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https

    # вот это не работает. надо понять почему
    #epm ei
    #epm play pycharm

elif [ "`hostname | grep m1580`" ] # для моноблоков
then

    # iptables
    iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    for i in `cat data/white_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
    done

    iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru

    for i in `cat data/black_site.lst`
    do
        iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
    done

    #iptables -A INPUT -p tcp --dport 22 -j DROP # блокируем входящий ssh

    # iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
    # iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https

    # вот это не работает. надо понять почему
    #epm ei
    #epm play pycharm

else # для неведомых зверушек
    # ничего не делаем
    echo do nothing
fi
