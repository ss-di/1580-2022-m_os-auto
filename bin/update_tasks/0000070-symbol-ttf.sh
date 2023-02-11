#!/bin/sh

wget -P /usr/share/fonts/ttf/ https://github.com/BannedPatriot/ttf-wps-fonts/blob/master/symbol.ttf && fc-cache -f -v || exit 1

