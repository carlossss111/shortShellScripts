#!/bin/bash
#07/07/20 Written By Daniel R
#Changes Linux Mint Cinnamon between two themes (light and dark).
#Edit any variables below to suit preferences.

#Light Mode
lBorders="Mint-Y"
lControls="Mint-Y"
lDesktop="Mint-Y-Sand"
lBackground="file:///home/daniel/Pictures/wallpapers/lightWallpaper.png"

#Dark Mode
dBorders="Mint-Y-Dark"
dControls="Mint-Y-Dark"
dDesktop="Mint-Y-Dark-Sand"
dBackground="file:///home/daniel/Pictures/wallpapers/darkWallpaper.jpg"

#If already light mode, switch to dark mode.
if [ `gsettings get org.cinnamon.theme name` == "'$lDesktop'" ]
then
    gsettings set org.cinnamon.theme  name "$dDesktop"
    gsettings set org.cinnamon.desktop.interface gtk-theme "$dControls"
    gsettings set org.cinnamon.desktop.wm.preferences theme "$dBorders"
    gsettings set org.gnome.desktop.background picture-uri "$dBackground"
    echo "Changed to the dark theme!"

#Else already dark mode, switch to light mode.
else
    gsettings set org.cinnamon.theme  name "$lDesktop"
    gsettings set org.cinnamon.desktop.interface gtk-theme "$lControls"
    gsettings set org.cinnamon.desktop.wm.preferences theme "$lBorders"
    gsettings set org.gnome.desktop.background picture-uri "$lBackground"
    echo "Changed to the light theme!"
fi
