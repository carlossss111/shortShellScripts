#!/bin/bash

#Written by Daniel 10/20.
#Creates C boilerplate.

if [ -z "$1" ] #if arg1 is empty
then
	echo "The name of the new C file is required as an arguement."
else #executes bulk of command
	name="$1"
	if [[ $1 != *.c ]] #add .c if not in the file name.
	then
		name="$1.c"
	fi

	#checks if the file already exists
	if [ -e $name ]
	then
		read -p "The file already exists, would you like to overwrite it? y/n: " overwrite
		if [ "$overwrite" = "n" ]
		then
		echo "File unchanged."
			exit
		fi
	fi

	touch "$name"
	echo -e "#include <stdio.h>\n\nint main(int argc, char **argv){\n\n\t/*instructions here*/\n\n\treturn 0;\n}" > "$name"
	echo "C file created as $name"
fi
