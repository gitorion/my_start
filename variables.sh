#!/usr/bin/env bash

# To follow is the variables associated with the my_start script.
#

checkcpu=`lscpu | grep "CPU max MHz"`
checkip4=`ip route get 8.8.8.8 2>/dev/null`
checkip6=`ip route get 2001:4860:4860::8888 2>/dev/null`

if [ -z "${checkcpu}" ]; then
	cpumhz=`lscpu | grep "CPU MHz" | awk '{print $3}'`
	else
	cpumhz=`lscpu | grep "CPU max MHz" | awk '{print $4}'`
fi

if [ -z "${checkip4}" ]; then
	ipv4=`echo "N/A"`
    else
	ipv4=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'`
fi

if [ -z "${checkip6}" ]; then
	ipv6=`echo "N/A"`
    else
	ipv6=`ip route get 2001:4860:4860::8888 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'`
fi

uname=`uname -a | awk -F " " '{print $1 " " $3 " " $4 " " $5}'`
distro=`grep -Po "(?<=^ID=).+" /etc/os-release | sed 's/"//g'`
thislog=`lastlog -u $USER | tail -n 1 | awk '{print $4 " " $5 " " $6 " " $7 " from " $3}'`
lastlog=`last | head -n 2 | tail -1 | awk '{print $1 " on " $2 ", " $4 " " $5 " " $6 " " $7 " from " $3}'`
uptime=`cut -d. -f1 /proc/uptime`
up_days=`expr $uptime / 60 / 60 / 24`
up_hours=`expr $uptime / 60 / 60 % 24`
up_minutes=`expr $uptime / 60 % 60`
up_seconds=`expr $uptime % 60`
loadavg=`cat /proc/loadavg | awk '{print $1 " " $2 " " $3 " " $4}'`
ctime=`ps -eo pcpu | awk '{tot=tot+$1} END {print tot}'`
ccores=`lscpu | grep "CPU(s)" | head -1 | awk '{print $2}'`
cpuse=`awk "BEGIN {printf \"%.2f\n\", ($ctime) / ($ccores)}"`
cpuspeed=`awk "BEGIN {printf \"%.2f\n\", ($cpumhz) / (1000)}"`
memuse=`free | grep Mem | awk '{ printf("%.1f", $3/$2 * 100.0) }'`
memtot=`free -h --giga | grep Mem | awk '{print $2}'`
swapuse=`free | grep Swap | awk '{ printf("%.1f", $3/$2 * 100.0) }' 2>/dev/null`
swaptot=`free -h --giga | grep Swap | awk '{print $2}'`
users=`who -q | tail -n1 | cut -c "9-11"`
sshusers=`ss | grep -i ssh | wc -l`
host=`uname -n`
diskuse=`df -h | awk '{if($(NF) == "/") {print $(NF-1); exit;}}'`
disksize=`df -h | awk '{if($(NF) == "/") {print $(NF-4); exit;}}'`
psu=`ps -aux | grep -i $USER | wc -l`
psa=`ps -aux | wc -l`

COLOR_DEFAULT="\033[0m"
COLOR_INFO="\033[0;37m"
COLOR_VALUE="\033[0;35m"
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
GP="${GREEN}[+]${NC}"
BA="${BLUE}[*]${NC}"
GA="${GREEN}[*]${NC}"