#!/bin/sh

exec > /var/log/update-sh.log 2>&1

cd /root/1580-2022-m_os-auto/
git pull

apt-get update && apt-get -y dist-upgrade && update-kernel -f && apt-get clean
apt-get -y install pascalabcnet
apt-get -y install scratch-desktop
epm ei
epm play pycharm

