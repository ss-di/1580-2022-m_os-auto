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
#    iptables -A OUTPUT -m string --string $i --algo kmp -j REJECT
done

# вот это не работает. надо понять почему
epm ei
epm play pycharm
