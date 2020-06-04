#!/bin/bash

###Script written by Daniel DD/MM
###Discord is unruly and sometimes doesn't open back up when closed unless killed. I could try to fix it but meh this is faster.
##Kills discord and loads it straight after.

#First matching line is grepped from the snapshort of current processes.
taskLine=`ps aux | grep -m 1 /app/discord/Discord`
#Numbers with 4 digits are grepped.
numbersInLine=`echo $taskLine | grep -o -m 1 '[0-9][0-9][0-9][0-9]'`
#First group of numbers (the PID) is stored.
PID=`echo $numbersInLine | head -c 4`
#The process is killed.
echo Killing discord with PID:$PID
kill $PID

#Ability to reopen coming soon
#/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=discord com.discordapp.Discord
