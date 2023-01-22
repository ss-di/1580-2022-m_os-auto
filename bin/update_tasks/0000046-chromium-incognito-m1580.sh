#!/bin/sh

[ ! "`hostname | grep m1580`" ] && exit

cp data/profile.d/10-chromium-default-incognito.sh /etc/profile.d/
chmod +x /etc/profile.d/10-chromium-default-incognito.sh
