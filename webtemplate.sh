#!/bin/bash

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
    echo -e '<!DOCTYPE html>\n\n<html lang="en" xmlns="http://www.w3.org/1999/xhtml">\n<head>\n  <meta charset="utf-8" />\n  <meta name="viewport" content="width=device-width, initial-scale=1.0">\n  <meta name="description" content="DESCRIPTION HERE"/>\n  <link href="./css/styles.css" type="text/css" rel="stylesheet" />\n  <title>TITLE HERE</title>\n</head>\n<body>\n</body>\n<html>' > ./index.html

    #WIP
    mkdir ./css
    touch ./css/styles.css
    mkdir ./scripts
    touch ./scripts/script.js

    #Completion message.
    echo Templated repository named $repoName has been created in $loc
fi
exit