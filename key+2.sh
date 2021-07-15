#!/bin/bash
#Daniel Robinson 07/21
#key+2key+2key+2key+2key+2key+2key+2key+2key+2key+2key+2

#validation
if [ -z "$1" ] || [ "$1" = '-d' ] && [ -z "$2" ];then
	echo 'Invalid args'
	echo 'USAGE: ./script [text to encrypt|"-d"] <text to decrypt>'
	exit 1;
fi

#decrypt & exit
if [ "$1" = '-d' ];then
	echo "$2" | tr '[c-za-b]' '[a-z]' | tr '[C-ZA-B]' '[A-Z]' #-2
	exit 0
fi

#'encrypt' & exit
echo "$1" | tr '[a-z]' '[c-za-b]' | tr '[A-Z]' '[C-ZA-B]' #+2
exit 0
