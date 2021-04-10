#!/bin/bash
# Daniel Robinson 2021
# Removes the '.git' folder from every sub directory of the first arguement.
# Breaks on whitespaces but I don't tend to have them lol.

#check for filename
if [ -z "$1" ]; then
	echo Provide a file-name as a first argument
	exit 1
fi

#delete .git folder from every sub-directory
found=false
for sub in `find $dir`
do
	if [[ $sub == *.git ]]; then
		read -p "rm $sub? [y/n]: " userInput
		if [ "$userInput" == "y" ]; then
			rm -rf $sub 
		fi
		found=true
	fi
done

#alert if nothing found
if [ "$found" == false ]; then
	echo "No git repositories were found."
fi

exit 0
