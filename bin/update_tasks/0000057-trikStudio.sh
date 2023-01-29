#!/bin/sh

apt-get -y install lego-mindstorms-udev-rules || exit 1
apt-get -y install trikStudio || exit 1

gpasswd -a student mindstormusers
gpasswd -a teacher mindstormusers
