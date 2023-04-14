#!/bin/sh

[ ! "`hostname | grep m1580-2-427`" ] && exit

cd /home/ && rm -f Windows_10.ova*
