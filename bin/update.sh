#!/bin/sh

cd /root/1580-2022-m_os-auto/
git pull

apt-get -y install pascalabcnet
apt-get -y install scratch-desktop
epm ei
epm play pycharm

