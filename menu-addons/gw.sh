#!/bin/bash

clear
echo ""
echo ""
echo ""
if [ -d "/home/pi/scripts/tmp/" ]; then
    echo "Borrando directorio temporal..."
    echo ""
    rm -r "/home/pi/scripts/tmp/"
    sleep 1
fi
echo "Descargando core lr-gw y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins/tree/master/menu-addons/patchs/lr-gw
sudo rm -R /opt/retropie/libretrocores/lr-gw
sudo cp -R lr-gw /opt/retropie/libretrocores/
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2