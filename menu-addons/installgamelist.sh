#!/bin/bash

echo ""
echo ""
echo "Descargando y copiando el gamelist original de la imagen y reinstalando el menu Addons..."
sleep 2
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/patchs/gamelist.xml>/opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ActualizarMenu.sh | bash

echo "Fix de instalacion con gamelist original aplicado!!!!"
sleep 3