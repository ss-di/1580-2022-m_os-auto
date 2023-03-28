#!/bin/sh

# обновление системы от разработчиков
apt-get update || exit 1
apt-get -y dist-upgrade || exit 1
update-kernel -f || exit 1
apt-get clean || exit 1

epm --auto ei || exit 1
epm --auto play code || exit 1
