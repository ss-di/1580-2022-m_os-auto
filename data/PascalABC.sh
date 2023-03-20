#!/bin/sh

# Распакуем архив, если нужно.
[ ! -d /home/student/.wine/ ] && tar xjpf /home/student-wine-PABC.tbz -C /home/student/

wine "/home/student/.wine/drive_c/Program Files/PascalABC.NET/PascalABCNET.exe"
