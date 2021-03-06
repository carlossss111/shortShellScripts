#!/bin/bash
# 2021 Daniel Robinson
# Puts an escape character before every instance of a token.
# If there is no arg2, the token default is a double quotemark.

if [ -z "$1" ];then
	echo Enter a string as the first arguement.
	exit 1;
fi
str="$1"

token=\"
if [ ! -z "$2" ];then
	token="$2"
fi

temp=$(echo $str | sed "s/\\\\$token/!!TEMP!!/g")
temp=$(echo $temp | sed "s/$token/\\\\$token/g")
echo $temp | sed "s/!!TEMP!!/\\\\$token/g"

exit 0
