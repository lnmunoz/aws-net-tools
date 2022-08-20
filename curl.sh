#!/bin/bash
ex = yum list installed | grep curl
if [ -z "$ex"]
then 
    echo "No está instalado "
else
    echo "Está instalado"
fi
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
