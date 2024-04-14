#!/bin/sh


[ -f "/home/rebooted.flg" ] && exit

touch /home/rebooted.flg && reboot

