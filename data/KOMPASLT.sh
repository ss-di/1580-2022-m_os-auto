#!/bin/sh

# Распакуем архив, если нужно.
[ ! -d /home/student/.wine/ ] && tar xjpf /home/student-wine-kompas_3d_lt.tbz -C /home/student/

wine "/home/student/.wine/drive_c/Program Files/ASCON/KOMPAS-3D LT V12/Bin/KOMPASLT.Exe"
