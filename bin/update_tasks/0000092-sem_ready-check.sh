#!/bin/sh

# exit

[ ! "`hostname | grep m1580-1`" ] && [ ! "`hostname | grep m1580-2`" ] && exit

[ "`date +%d%m | grep 2004`" ] &&  [ ! -f /home/semestrovaya-rulezzz ] && touch /home/semestrovaya-rulezzz && reboot

touch /home/semestrovaya-rulezzz
