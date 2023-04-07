#!/bin/sh

# Распакуем винду, если нужно.
#[ ! -d /home/teacher/VirtualBox\ VMs/Windows\ 10/ ] && VBoxManage import /home/Windows_10.ova

VBoxManage startvm "Windows 10"
