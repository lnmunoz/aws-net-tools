#!/bin/bash
yum update  
yum install curl
echo("IP configuration")
ifconf
echo ("Routes")
route -n


