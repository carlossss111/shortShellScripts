#!/bin/bash
#Daniel Robinson 2021
#Sets discover printers on/off with gnome
if `grep -q "BrowseRemoteProtocols dnssd cups" /etc/cups/cups-browsed.conf`;then
	sudo sed -i s/"BrowseRemoteProtocols dnssd cups"/"BrowseRemoteProtocols none"/g /etc/cups/cups-browsed.conf
	echo LAN printers are no longer automatically discoverable.
else
	sudo sed -i s/"BrowseRemoteProtocols none"/"BrowseRemoteProtocols dnssd cups"/g /etc/cups/cups-browsed.conf
	echo LAN printers are now automatically discoverable.
fi
sudo service cups restart
exit 0
