#!/bin/bash

cd /home/pi
if [ -d '/home/pi/configsremaps' ] ;
then
        sudo rm -R '/home/pi/configsremaps'
        mkdir '/home/pi/configsremaps'
else
        mkdir '/home/pi/configsremaps'
fi
cd configsremaps
echo "Descargando y copiando configuraciones y remapeos de sistemas al directorio configs..."
sleep 2
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins/tree/master/configs
cp -R configs /opt/retropie/
cd ..
rm -r configsremaps