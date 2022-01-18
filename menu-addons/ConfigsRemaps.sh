#!/bin/bash

cd /home/pi
if [ -d /home/pi/configsremaps ]; then
        sudo rm -R /home/pi/configsremaps
        mkdir /home/pi/configsremaps
else
        mkdir /home/pi/configsremaps
fi
cd configsremaps
#Downloading and copying emulators configs
#echo "Download and copy emulators configs"
#sleep 2
#~/scripts/github-downloader.sh https://github.com/julenvitoria/Kelboy-ConfigsRemaps/tree/master/emulators
#sudo cp -R emulators /opt/retropie/
#Downloading and copying systems-games configs and remaps
echo "Download and copy systems-games configs and remaps"
sleep 2
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins/tree/master/menu-addons/iconos
cp -R configs /opt/retropie/
cd ..
rm -r configsremaps