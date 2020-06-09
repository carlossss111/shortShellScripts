#!/bin/bash

###Symlink /usr/local/bin. (with "ln -s /home/daniel/PATH/TO/scripttemplate.sh /usr/local/bin/mkshell" ran as root.)
###Script written by Daniel, 06/20.
###Creates .sh template file with appropriate permissions..

if [ -z "$1" ] #If either arguement is empty
then
	echo "The file name (or path) is required as an arguement." 	
else #Else execute the command.
	name="$1"
	if [[ $1 != *.sh ]] #If the file extension is not included, add it.
	then
		name="$1.sh"	
	fi
	#Now the name is valid, creat the file with the template and permissions.
	touch "$name"
	echo "#!/bin/bash" > "$name"
	chmod 755 "$name"
	echo "Shell file created as $name"
fi
	
