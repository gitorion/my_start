#!/usr/bin/env bash

# This is my_start - a script to run on linux systems at login to display a welcome message and display system information.
#

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/variables.sh"

echo
printf "${COLOR_INFO}Hello $USER and welcome to $host...\n"
printf "${COLOR_VALUE}===========================================================\n"
printf "${COLOR_INFO}${GA} Last system login	:${COLOR_VALUE} %s\n" "$lastlog"
printf "${COLOR_INFO}${GA} System details	:${COLOR_VALUE} %s\n" "$uname | $distro |"
printf "${COLOR_INFO}${GA} System uptime	:${COLOR_VALUE} %s\n" "$up_days days $up_hours hours $up_minutes minutes $up_seconds seconds"
printf "${COLOR_INFO}${GA} System load		:${COLOR_VALUE} %s\n" "$loadavg"
printf "${COLOR_INFO}${GA} CPU in use		:${COLOR_VALUE} %s\n" "$cpuse% of $ccores X $cpuspeed"GHz""
printf "${COLOR_INFO}${GA} Memory in use	:${COLOR_VALUE} %s\n" "$memuse% of $memtot"
printf "${COLOR_INFO}${GA} Swap memory in use	:${COLOR_VALUE} %s\n" "$swapuse% of $swaptot"
printf "${COLOR_INFO}${GA} Current disk use    :${COLOR_VALUE} %s\n" "$diskuse of $disksize"
printf "${COLOR_INFO}${GA} System processes	:${COLOR_VALUE} %s\n" "$USER running $psu, total of $psa running on $host"
printf "${COLOR_INFO}${GA} SSH logins		:${COLOR_VALUE} %s\n" "$sshusers user(s) logged in via SSH"
printf "${COLOR_INFO}${GA} Total logins	:${COLOR_VALUE} %s\n" "$users user(s) in total logged in"
printf "${COLOR_INFO}${GA} Login details	:${COLOR_VALUE} %s\n" "$thislog"
printf "============================================================\n"
printf "${COLOR_INFO}${BA}${GP}${BA} IPv4 address	:${COLOR_VALUE} %s\n" "$ipv4"
printf "${COLOR_INFO}${BA}${GP}${BA} IPv6 address	:${COLOR_VALUE} %s\n" "$ipv6"
printf "============================================================\n"
printf "${COLOR_DEFAULT}"