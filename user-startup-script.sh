#!/bin/bash
# Scripts to be run on system startup

# turn off CPU turbo
echo '1' > /sys/devices/system/cpu/intel_pstate/no_turbo

# relink steam
rm /drive/B/SteamLibrary/steamapps/compatdata
ln -s /home/daniel/.steam/steam/steamapps/compatdata/ /drive/B/SteamLibrary/steamapps/compatdata

exit 0
