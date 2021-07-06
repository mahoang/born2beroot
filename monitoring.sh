#!/bin/bash
arch=$(uname -a)
a=$(free | grep Mem | cut -c13-16)
b=$(free | grep Mem | cut -c27-28)
c=$((100*$b/$a))
du=$(df --total -h | grep total | cut -c39-42)
du2=$(df --total -h | grep total | cut -c45-49)
du3=$(df --total -h | grep total | cut -c52-54)
userl=$(users | wc -w)
lvm=$(lsblk | grep "lvm" | wc -l)
lvmyn=$(if [ $lvm -ge 0 ]; then echo yes; else echo no; fi)
lboot=$(who -b | cut -c23-40)
cpu1=$(top -bin1 | grep Cpu | awk {'print $2'})
cpu2=$(top -bin1 | grep Cpu | awk {'print $4'})
cpulo=echo $cpu1 + $cpu2
echo "Monitoring Value :"
echo "---"
echo "#Architecture : $arch"
echo "#CPU physical : $(nproc)"
echo "#vCPU : $(cat /proc/cpuinfo | grep processor | cut -c13)"
echo "#Memory Usage : $b/$a ($c%)"
echo "#Disk Usage : $du/$du2 ($du3)"
echo "#CPU Load:$cpulo% | $cpu1+$cpu2"
echo "Last boot:$lboot"
echo "LVM use: $lvmyn"
echo "Connexions TCP:"
echo "#User log :$userl"
echo "Network :"
echo "Sudo:"

#echo "a = $a"
#echo "b = $b"
echo "c = $c%"
#echo "du = $du"
#echo "du2 = $du2"
#echo "du3 = $du3"
#echo "lvm $lvm"
#echo "lvmyn $lvmyn"
