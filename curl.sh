#!/bin/bash
#if [ -z "yum list installed | grep curl"]
#Check linux distro
cat /etc/os-release | grep ubuntu > ubuntu.txt 
cat /etc/os-release | grep amazon > amazon.txt 
cat /etc/os-release | grep alpine > alpine.txt 
ubuntu=ubuntu.txt
amazon=amazon.txt
alpine=alpine.txt
if [ -s "$ubuntu" ];then 
    echo "Tu distribución es Ubuntu"
    dpkg -l | grep curl > curl.txt
    dpkg -l | grep telnet > telnet.txt
    file=curl.txt
    file2=telnet.txt
    #######Chequeo de Curl############
    if [ -s "$file" ];then 
    echo "Curl está instalado "
    else
    echo "Curl no está instalado"
    apt install curl
    fi
    ######Chequeo de Telnet##########
    if [ -s "$file2" ];then 
    echo "Telnet está instalado "
    else
    echo "Telnet no está instalado"
    apt install -y telnet
    fi
elif [ -s "$amazon" ];then 
    echo "Tu distribución es Amazon"
    yum list installed | grep curl > curl.txt
    yum list installed| grep telnet > telnet.txt
    file=curl.txt
    file2=telnet.txt
       #######Chequeo de Curl############
    if [ -s "$file" ];then 
    echo "Curl está instalado "
    else
    echo "Curl no está instalado"
    yum -y install curl
    fi
    ######Chequeo de Telnet##########
    if [ -s "$file2" ];then 
    echo "Telnet está instalado "
    else
    echo "Telnet no está instalado"
    yum -y install telnet
    fi
elif [ -s "$alpine" ];then 
    echo "Tu distribución es Alpine"
    apk info | grep -w "curl" > curl.txt
    apk info | grep busybox-extras > telnet.txt
    file=curl.txt
    file2=telnet.txt
    if [ -s "$file" ];then 
    echo "Curl está instalado "
    else
    echo "Curl no está instalado"
    apk add curl  
    fi
    ######Chequeo de Telnet##########
    if [ -s "$file2" ];then 
    echo "Telnet está instalado "
    else
    echo "Telnet no está instalado"
    apk add busybox-extras
    fi
else
    echo "Distribución no compatible"
fi


rm curl.txt
rm telnet.txt

# yum -y install telnet

# apt-get install telnet

# apk add busybox-extras






# if [ -s "$file" ];then 
#     echo "Curl está instalado "
# else
#     echo "Curl no está instalado"
#     if [ ]

# fi
rm ubuntu.txt
rm amazon.txt
rm alpine.txt
# echo "----------------------------------------------------"
# echo "IP configuration"
# ifconfig
# echo "----------------------------------------------------"
# echo "Routes"
# route -n

echo "----------------------------------------------------"
echo "Summary"
echo "IPs"
ifconfig | grep inet
echo "Gateway"
route -n | grep UG
