#!/bin/bash
#Opens a new session of vim while retaining the current terminal session. 
if [ -z "$1" ]
then
	echo "A file name is required as an arguement."
else		
	gnome-terminal -e "vim $1" 2> /dev/null	
fi
