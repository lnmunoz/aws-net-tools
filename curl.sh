#!/bin/bash
#if [ -z "yum list installed | grep curl"]
#Check linux distro
cat /etc/os-release | grep ubuntu > ubuntu.txt 
cat /etc/os-release | grep amazon > amazon.txt 
ubuntu=ubuntu.txt
amazon=amazon.txt
if [ -s "$ubuntu" ];then 
    echo "Tu distribución es Ubuntu"
    dpkg -l | grep curl > pkg.txt
    file=pkg.txt
elif [ -s "$amazon" ];then 
    echo "Tu distribución es Amazon"
    yum list installed | grep curl > pkg.txt
    file=pkg.txt
else
    echo "Distribución no compatible"
fi



if [ -s "$file" ];then 
    echo "Curl está instalado "
else
    echo "Curl no está instalado"

fi
rm ubuntu.txt
rm amazon.txt
rm pkg.txt
#yum update  
#yum install curl -y
echo "----------------------------------------------------"
echo "IP configuration"
ifconfig
echo "----------------------------------------------------"
echo "Routes"
route -n

echo "----------------------------------------------------"
echo "Summary"
echo "IPs"
ifconfig | grep inet
echo "Gateway"
route -n | grep UG
