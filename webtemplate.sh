#!/bin/bash

###Symlink /usr/local/bin. (with "ln -s /home/daniel/PATH/TO/webtemplate.sh /usr/local/bin/mkweb" ran as root.)
###Script written by Daniel, 05/20.
###Creates a new git repository at $loc with boilerplate HTML,CSS and JS.

if [ -z "$1" ] #If the arguement is empty
then
    echo The name of the new repository is required as an arguement.
else #Else execute the command.

    #Arguement one = Repo name
    repoName=$1

    #Goes to the target location
    loc="/home/daniel/Documents/repos/"
    cd $loc

    #Makes a new directory
    mkdir ./$repoName
    cd ./$repoName

    #Creates the boilerplate HTML file and code.
    touch ./index.html
    echo -e '<!DOCTYPE html>\n\n<html lang="en" xmlns="http://www.w3.org/1999/xhtml">\n<head>\n  <meta charset="utf-8" />\n  <meta name="viewport" content="width=device-width, initial-scale=1.0">\n  <meta name="description" content="DESCRIPTION HERE"/>\n  <link href="./css/styles.css" type="text/css" rel="stylesheet" />\n  <title>TITLE HERE</title>\n  <script src="./scripts/script.js"></script>\n</head>\n<body>\n</body>\n</html>' > ./index.html

    #Creates the boilerplate CSS file and code.
    mkdir ./css
    touch ./css/styles.css
    echo -e '* {\n   margin: 0;\n   padding: 0;\n   outline: 0;\n}' > ./css/styles.css

    #Creates JS file
    mkdir ./scripts
    touch ./scripts/script.js

    #Create image directory
    mkdir ./images

    #Completion message.
    echo Templated repository named $repoName has been created in $loc

    #Initialise git, print error message if that fails.
    git init || echo Git is not installed, git repository not initialised.
fi
exit
