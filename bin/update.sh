#!/bin/sh

exec > /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /root/1580-2022-m_os-auto/
git pull

apt-get update && apt-get -y dist-upgrade && update-kernel -f && apt-get clean # обновление системы от разработчиков

#разовые задачи
for task in bin/update_tasks/*.sh
do
    [ ! -f $task.done ] && sh $task && touch $task.done
done

# iptables
for i in `cat data/white_site.lst`
do
    iptables -A OUTPUT -m string --string $i --algo kmp -j ACCEPT
done

for i in `cat data/black_site.lst`
do
    iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
done

#iptables -A INPUT -p tcp --dport 22 -j DROP # блокируем входящий ssh

iptables -A OUTPUT -d 81.177.135.190 -j ACCEPT # разрешаем sdo.1580.ru
#iptables -A OUTPUT -p tcp --dport 80 -j DROP # блокируем исходящий http
#iptables -A OUTPUT -p tcp --dport 443 -j DROP # блокируем исходящий https

# вот это не работает. надо понять почему
#epm ei
#epm play pycharm
