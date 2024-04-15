#!/bin/sh


[ ! -f "/home/rebooted.flg" ] && exit

rm -f /home/rebooted.flg && reboot

