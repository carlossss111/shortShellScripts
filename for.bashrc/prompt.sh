#!/bin/bash

###Code moved into the end of ~/.bashrc to change prompt.
###Script written by Daniel 06/20
if [ `whoami` == "root" ]
then
        PS1="\[\033[s\033[0;0H\033[1;41m\033[KBASH \V, \u@\H\033[0m\033[u\]\[\033[1;31m\]\w# \[\033[00m\]"
else
        PS1="\[\033[s\033[0;0H\033[1;42m\033[KBASH \V, \u@\H\033[0m\033[u\]\[\033[1;32m\]\w\$ \[\033[00m\]"
fi
export PS1

