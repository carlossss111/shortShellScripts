#!/bin/bash
# Daniel 2023
# Reroutes time-wasting IPs to localhost
readonly HOSTFILE='/etc/hosts'
readonly DOMAINS=('www.youtube.com')

# user must be root to change hostfile
if [ "$EUID" -ne 0 ]; then echo 'Please run with sudo!'; exit 1; fi

# add all domains
if [ "$1" = 'on' ]; then
	for i in ${!DOMAINS[@]}; do
		echo "127.0.0.1 ${DOMAINS[$i]}" >> "$HOSTFILE"
	done
# remove all domains and trim trailing blank lines
elif [ "$1" = 'off' ]; then
	for i in ${!DOMAINS[@]}; do
		sed -e "s/127\.0\.0\.1 ${DOMAINS[$i]}//g" -i "$HOSTFILE"
	done
	sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' -i "$HOSTFILE"
else
	echo 'Usage: stopwastingtime <on/off>'
fi
exit 0 
