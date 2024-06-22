#!/bin/bash
# Daniel R 2024
# Default URL provided by https://github.com/Ultimate-Hosts-Blacklist
readonly LOCALFILE='./hosts'
readonly HOSTFILE='/etc/hosts'
readonly BACKUPHOSTFILE='/etc/hosts.backup'
url='https://hosts.ubuntu101.co.za/hosts'

# user must be root to change hostfile
if [ "$EUID" -ne 0 ]; then echo 'Please run with sudo!'; exit 1; fi

# take optional arg
if [ "$1" = '--help' ]; then
	echo 'Usage: updatehost [optional url]'
	exit 0
elif [ -n "$1" ]; then
	url="$1"
fi

# download updated hostfile
wget "$url" --no-cookies --max-redirect=0 --secure-protocol=TLSv1_3 --https-only --no-clobber
if [ "$?" -ne 0 ]; then echo 'Failed to download file.'; exit 1; fi

# compare hostfile and get confirmation (i should learn perl)
echo -e "Diff snippet:"
sudo diff --color=always "$HOSTFILE" "$LOCALFILE" | sed 's/\[36m.*//g' | tr -d '\n' | sed 's/\[0m/\[0m\n/g' | sed 's/---//g' | head -n 10
echo -e "...\n"
read -r -p 'Confirm? [y/n/details]' userin
if [ "$userin" = 'details' ]; then
	sudo diff --color=always hosts "$HOSTFILE" | less -R
	read -r -p 'Confirm? [y/n]' userin
fi
if [ "$userin" != 'y' ]; then
	rm "$LOCALFILE"
	exit 0
fi

# replace hostfile
sudo mv "$HOSTFILE" "$BACKUPHOSTFILE" || exit 1
sudo mv "$LOCALFILE" "$HOSTFILE" || exit 1
echo 'Hostfile replaced successfully!'
exit 0

