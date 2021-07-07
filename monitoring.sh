#!/bin/bash
arch=$(uname -a)
a=$(free | grep Mem | awk {'print $2'})
b=$(free | grep Mem | awk {'print $3'})
c=$((100*$b/$a))
du=$(df --total -h | grep total | awk {'print $2'})
du2=$(df --total -h | grep total | awk {'print $3'})
du3=$(df --total -h | grep total | awk {'print $5'})
userl=$(users | wc -w)
lvm=$(lsblk | grep "lvm" | wc -l)
lvmyn=$(if [ $lvm -ge 0 ]; then echo yes; else echo no; fi)
lboot=$(who -b | awk {'print $3 " "  $4'})
cpu1=$(top -bin1 | grep Cpu | awk {'print $2'})
cpu2=$(top -bin1 | grep Cpu | awk {'print $4'})
cpulo=$(top -bin1 | grep Cpu | awk {'print $2 + $4'}
TCP=$(cat /proc/net/sockstqt | grep TCP | awk '{print $3}')
ip=$(hostname -I)
mac=$(ip link show | grep link/ether | awk '{print $3}')
echo "Monitoring Value :"
echo "---"
echo "#Architecture : $arch"
echo "#CPU physical : $(nproc)"
echo "#vCPU : $(cat /proc/cpuinfo | grep processor | cut -c13)"
echo "#Memory Usage : $b/$a ($c%)"
echo "#Disk Usage : $du/$du2 ($du3)"
echo "#CPU Load:$cpulo%"
echo "Last boot:$lboot"
echo "LVM use: $lvmyn"
echo "Connexions TCP:$TCP ESTABLISHED"
echo "#User log :$userl"
echo "Network :$ip ($mac)"
echo "Sudo:"

#echo "a = $a"
#echo "b = $b"
echo "c = $c%"
#echo "du = $du"
#echo "du2 = $du2"
#echo "du3 = $du3"
#echo "lvm $lvm"
#echo "lvmyn $lvmyn"
