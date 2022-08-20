#!/bin/bash
#yum update  
#yum install curl -y
echo ----------------------------------------------------
echo "IP configuration"
ifconfig
echo ----------------------------------------------------
echo "Routes"
route -n

---------------------------------------------------------
echo "Summary"
echo "IPs"
ifconfig | grep inet
echo "Gateway"
route -n | grep UG
