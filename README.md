# Short Shell Scripts
## Overview
This is a collection of short shell scripts that I have created for personal use. Scripts in the project root directory are able to be linked /usr/local/bin so that they can be run globally. Scripts inside for.bashrc aren't intended to be run, instead the code within is best copied into the end of ~/.bashrc so that it is executed whenever a terminal window is opened.
* __helloworld.sh__ - My first script, loads "Hello World".
* __webtemplate.sh__ - _Takes 1 Arg_, _called globally as 'mkweb' on my PC_, creates a new directory with the name provided, filled with boilerplate HTML, CSS and JS code.
* __killdiscord.sh__ - _Called globally as 'kdiscord' on my PC_, kills the discord application (it freezes sometimes) and immediately reopens it.
* __scripttemplate.sh__ - _Called globalled as 'mkshell' on my PC_, makes a shell script with the correct template and permissions.
* __for.bashrc/defaultdir__ - _Copy/paste to ~/.bashrc_, sets the default working directory for each terminal session.
* __for.bashrc/prompt__ - _Copy/paste to ~/.bashrc_, sets PS1 to a different ANSI escape sequence, giving the terminal prompt a theme (also depending on whether root or local).

Most of these will probably need tweaking for PCs, but they are very short so that will not be difficult or time-consuming. 
