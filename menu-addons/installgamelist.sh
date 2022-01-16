#!/bin/bash

echo "Downloading and copying original retropie section gamelist.xml and reinstalling Addons Menu..."
sleep 2
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/gamelist.xml>/opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/install.sh | bash

echo "Install with gamelist fix applied!!!"
sleep 3