#!/bin/sh

apt-get -y install veyon || exit 1

chmod 0750 /usr/bin/veyon-master || exit 1
chmod 0750 /usr/bin/veyon-configurator || exit 1

chown root:teacher /usr/bin/veyon-master || exit 1
chown root:teacher /usr/bin/veyon-configurator || exit 1
