#!/bin/sh

cd /tmp/ && \
wget -nc https://wingware.com/pub/wing-101/9.0.1.0/wing-101-9-9.0.1-0.x86_64.rpm && \
apt-get install wing-101-9-9.0.1-0.x86_64.rpm || exit 1

cd /tmp/ && \
wget -nc https://wingware.com/pub/wing-personal/9.0.1.0/wing-personal9-9.0.1-0.x86_64.rpm && \
apt-get install wing-personal9-9.0.1-0.x86_64.rpm || exit 1
