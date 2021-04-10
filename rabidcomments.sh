#!/bin/bash
# Daniel Robinson 2021
# Takes a file as first arguement and a language as a second and comments the entire thing

if [ -z "$1" ]; then
	echo Provide a file-name as a first arguement
	exit 1
fi

file="$1"
extension="${file#*.}"

case "$extension" in
	'c'|'cpp'|'h'|'java'|'js'|'php'|'css')
		echo -e "/*\n$(cat $file)\n*/" > $file
		;;
	'sh'|'py')
		sed -ie 's/^/#/' "$file"
		;;
	'html')
		echo -e "<!--\n$(cat $file)\n-->" > $file
		;;
	'hs')
		echo -e "{-\n$(cat $file)\n-}" > $file
		;;
	*)
		echo Unimplemented file extension. 
		;;
esac
exit 0
