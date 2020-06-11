#!/bin/bash

#The user's ~ directory is needed so this script cannot be run as root.
if [ `whoami` == "root" ]
then
	echo "Please run this script as the user, not as root."
	exit
fi

terminalCols=`tput cols` #Gets the number of columns in the terminal.
splash="Welcome to the bash prompt customiser!" #Splash Message.
halfSplash=$(( ${#splash} / 2 )) #Gets half the length of the splash message.
middleCol=$(( ($terminalCols / 2) - $halfSplash )) #Calculates middle column.

clear
tput cuf $middleCol #Moves middle col spaces right.
echo -e "\033[1;32m$splash\n\033[0m"
echo -e "This script appends code to \033[1;32m~/.bashrc\033[0m (which always runs when a terminal window is opened) so that it points to a new file, \033[1;32m~/.custom-prompt.sh\033[0m, which will customise the bash prompt.\n"
echo -e "\033[0;37mWritten by Daniel Robinson\n@ https://github.com/carlossss111\n10/06/2020, Version 1\033[0m"

echo -e "\nPress enter to begin."
read
clear

echo "What colour would you like for the user prompt? Choose from:"
echo -e "'\033[1;31mred\033[0m', '\033[1;32mgreen\033[0m', '\033[1;33myellow\033[0m', '\033[1;34mblue\033[0m', '\033[1;35mpurple\033[0m', '\033[1;36mcyan\033[0m', '\033[1;30mgrey\033[0m'."

read -p "INPUT: " usrInput 
usrEsc='\033['
usrHighlightEsc='\033['

#Holds the escape sequences for the user colour and user highlighting.
case $usrInput in 
	"red")
		usrEsc+='1;31m'
		usrHighlightEsc+='1;41m'
		;;
	"green")
                usrEsc+='1;32m'
		usrHighlightEsc+='1;42m'
                ;;
	"yellow")
		usrEsc+='1;33m'
		usrHighlightEsc+='1;43m'
		;;
	"blue")
		usrEsc+='1;34m'
		usrHighlightEsc+='1;44m'
		;;
	"purple")
		usrEsc+='1;35m'
		usrHighlightEsc+='1;45m'
		;;
	"cyan")
		usrEsc+='1;36m'
		usrHighlightEsc+='1;46m'
		;;
	"grey")
		usrEsc+='1;30m'
		usrHighlightEsc+='1;47m'
		;;
	*)
		clear
		echo -e "\nInput not recognised. Exiting script."
 		exit
		;;		

esac

usrHeader='\[\033[s\033[0;0H'
usrHeader+="$usrHighlightEsc"
usrHeader+='\033[KBASH \V, \u@\H\033[0m\033[u\]'

usrMain='\['
usrMain+="$usrEsc"
usrMain+='\]\w$ \[\033[00m\]'

echo -e "\nWhat colour would you like for the ROOT prompt? It is recommended to have a different colour from the last. (Choose from the same options)."

read -p "INPUT: " rootInput
rootEsc='\033['
rootHighlightEsc='\033['

#Gets the escape colour for the root.
case $rootInput in
        "red")
                rootEsc+='1;31m'
                rootHighlightEsc+='1;41m'
                ;;
        "green")
                rootEsc+='1;32m'
                rootHighlightEsc+='1;42m'
                ;;
        "yellow")
                rootEsc+='1;33m'
                rootHighlightEsc+='1;43m'
                ;;
        "blue")
                rootEsc+='1;34m'
                rootHighlightEsc+='1;44m'
                ;;
        "purple")
                rootEsc+='1;35m'
                rootHighlightEsc+='1;45m'
                ;;
        "cyan")
                rootEsc+='1;36m'
                rootHighlightEsc+='1;46m'
                ;;
        "grey")
                rootEsc+='1;30m'
                rootHighlightEsc+='1;47m'
                ;;
        *)
		clear
                echo -e "\nInput not recognised. Exiting script."
                exit
                ;;
esac

rootHeader='\[\033[s\033[0;0H'
rootHeader+="$rootHighlightEsc"
rootHeader+='\033[KBASH \V, \u@\H\033[0m\033[u\]'

rootMain='\['
rootMain+="$rootEsc"
rootMain+='\]\w# \[\033[00m\]'

echo -e "\nWould you like a header? [y/n]"
read -p "INPUT: " headerInput

usrFullEsc=""
rootFullEsc=""

#Checks if the user wants a header, then constructs the escape sequences for PS1.
if [ "$headerInput" == "y" ] 
then
	usrFullEsc="$usrHeader$usrMain"
	rootFullEsc="$rootHeader$rootMain"	
elif [ "$headerInput" == "n" ]
then
	usrFullEsc="$usrMain"
	rootFullEsc="$rootMain"
else
	clear
	echo -e "\nInput not recognised. Exiting script."
        exit
fi

#Checks if the user wants a default directory.
echo -e "\nFinally, if you would to start each terminal at a specific directory, write it's path here (or leave blank if not). Please enter an absolute path."
read -p "INPUT: " defaultPath
until [ -z $defaultPath ] || [ -e $defaultPath ]
do
	echo "$defaultPath is not recognised make sure that the path is absolute."
	read -p "INPUT: " defaultPath
done

#If this script has been used before there will already be a file, so it can just be overwritten, otherwise write a new file and make .bashrc point to it.
clear
echo -e "All inputs taken! Performing actions.\n"

readonly customFile="/home/`whoami`/.custom-prompt.sh"
if [ ! -e "$customFile" ]
then
	echo "$customFile not found, creating a new one ..."
	echo "Pointing .bashrc to $customFile ..."

	echo "" >> ~/.bashrc
	echo "#Lines implemented by Prompt Customiser:" >> ~/.bashrc
	echo "if [ -e $customFile ]" >> ~/.bashrc
	echo 'then' >> ~/.bashrc
	echo "	source $customFile" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
else
	echo "$customFile found, overwriting..."
	> $customFile #Wipe
fi

echo "Writing to $customFile ..."

echo "#!/bin/bash" >> "$customFile"
echo "#Bash prompt customiser by Daniel @https://github.com/carlossss111" >> "$customFile"
echo "#`date`" >> "$customFile"
echo 'if [ `whoami` == "root" ]' >> "$customFile"
echo 'then' >> "$customFile"
echo "	PS1=\"$rootFullEsc\"" >> "$customFile"
echo 'else' >> "$customFile"
echo "	PS1=\"$usrFullEsc\"" >> "$customFile"
echo fi >> "$customFile"
echo "export PS1" >> "$customFile"
if [ $headerInput == "y" ]
then
	echo "echo \"\"" >> "$customFile"
fi
echo "" >> "$customFile"
echo "if [ -d $defaultPath ]" >> "$customFile"
echo "then" >> "$customFile"
echo "	cd $defaultPath" >> "$customFile"
echo "fi" >> "$customFile"

echo ""
echo "All actions completed. A new file has been created at $customFile. To revert to the system prompt simply delete it with [rm $customFile]. To try other prompts, simply rerun this script."
echo "Exit and open a new terminal window to see the changes."
