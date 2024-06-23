#!/bin/bash
# Daniel R 2024

brightness=`cat /sys/class/backlight/acpi_video0/brightness`
if [ -z "$brightness" ]; then
	exit 1
fi

/usr/bin/system76-power profile battery
echo "$brightness" > /sys/class/backlight/acpi_video0/brightness
exit 0
