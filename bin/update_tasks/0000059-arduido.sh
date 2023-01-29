#!/bin/sh

apt-get -y install arduino || exit 1

gpasswd -a student uucp
gpasswd -a teacher uucp
