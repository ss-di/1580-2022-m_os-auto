#!/bin/sh

exec > /var/log/update-sh.log 2>&1 # перенаправляем весь вывод в лог для анализа чего не рабтает

cd /root/1580-2022-m_os-auto/
git pull

apt-get update && apt-get -y dist-upgrade && update-kernel -f && apt-get clean # обновление системы от разработчиков

# установка пакетов. надо перевести в разряд разовых комманд.
apt-get -y install pascalabcnet
apt-get -y install scratch-desktop

# вот это не работает. надо понять почему
epm ei
epm play pycharm

