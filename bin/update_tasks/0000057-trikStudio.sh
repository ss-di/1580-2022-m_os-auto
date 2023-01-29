#!/bin/sh

apt-get install trikStudio || exit 1

gpasswd -a student mindstormusers
gpasswd -a teacher mindstormusers
