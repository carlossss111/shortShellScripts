#!/bin/bash
# Decrypts token and uses it to push to a git repository.
username='carlossss111'
password=`gpg -d ~/.tokens/github.gpg | awk '{print $NF}'`

# It's really about time I learn awk or perl...
hostname=`git remote -v | tail -n 1 | cut -d $'\t' -f 2 | cut -d ' ' -f 1 | cut -d ' ' -f 1 | cut -d '/' -f 3-`

git push "https://$username:$password@$hostname"
password=''
exit 0
