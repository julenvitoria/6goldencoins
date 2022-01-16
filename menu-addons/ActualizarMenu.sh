#!/bin/bash

clear
cd /home/pi
if [ -d /home/pi/RetroPie/retropiemenu/#Menu-Addons ]; then
        echo "Directorio Menu-Addons ya fue creado anteriormente."
        echo "Actualizando Menu-Addons..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/#Menu-Addons
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons
else
        echo "Creando directorio Menu-Addons e instalando..."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons
fi

#Instalar al actualizador del menu de addons
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ActualizarMenu.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh
if grep -q "ActualizarMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El actualizador de Menu-Addons ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ActualizarMenu.sh</path>\n\t\t<name>Actualizar este menu</name>\n\t\t<desc>Script para actualizar el menu addons. Aparte de realizar cambios en los scripts tambien es posible que aparezcan nuevas opciones despues de actualizar.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar el actualizador del sistema
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/UpdateUpgrade.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgrade.sh
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script update y upgrade al sistema ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateUpgrade.sh</path>\n\t\t<name>Actualizar sistema operativo</name>\n\t\t<desc>Script para actualizar los paquetes del sistema de manera con un solo click ¡¡¡ATENCION: USA BAJO TU PROPIA RESPONSABILIDAD!!!</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Instalar actualizador emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ActualizarEmulators.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarEmulators.sh
if grep -q "ActualizarEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script para actualizar el archivo emulators.cfg ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateEmulators.sh</path>\n\t\t<name>Descargar emulators.cfg originalfile</name>\n\t\t<desc>Script para descargar el archivo emulators.cfg original de la imagen. Esto significa qur tambien cambiara en el caso de que se realice algun cambio para mejorar la emulacion en algun juego. ¡¡¡ATENCION: Si has realizado cambios en la eleccion de emuladores y ejecutas esta operacion perderas dichos cambios si no existen en el archivo descargado. En este caso se recomienda realizar una copia de seguridad antes de ejecutarlo!!!</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar ConfigsRemaps
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ConfigsRemaps.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh
if grep -q "ConfigsRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "ConfigsRemaps ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ConfigRemaps.sh</path>\n\t\t<name>Configuraciones y remapeos</name>\n\t\t<desc>Script para descargar/actualizar configuraciones de emuladores y mapeos de diversos juegos y sistemas. ¡¡¡ATENCION: Si has realizado cambios en las configuraciones o remapeos y ejecutas esta operacion perderas dichos cambios si al descargarse se machacan los archivos. En este caso se recomienda realizar una copia de seguridad antes de ejecutarlo!!!</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Crear directorio de fixes
if [ -d /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes ]; then
        echo "Directorio Fixes ya fue creado anteriormente... Descargando Fixes..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
else
        echo "Creando directorio Fixes y descargándolos..."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
fi

#Instalar fixes!!
#Instalar gamelist & install fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/installgamelist.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/installgamelist.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/installgamelist.sh
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Install with Gamelist fix ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/installgamelist.sh</path>\n\t\t<name>Reinstalar Addons-Menu con gamelist original de retropie</name>\n\t\t<desc>Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si cambio los nombres de los addons en gamelist.xml).</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Restore systems fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoresystems.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/restoresystems.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/restoresystems.sh
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/restoresystems.sh</path>\n\t\t<name>Restore systems</name>\n\t\t<desc>ENG: Script to restore aditional custom systems in es_systems.cfg after an update of the retropie setup script for example.\nESP: Script para restaurar sistemas personalizados adicionales en es_systems.cfg después de una actualización del script de configuración de retropie, por ejemplo.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install audio fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/audiofix.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/audiofix.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/audiofix.sh
if grep -q "audiofix.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Audio fix ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/audiofix.sh</path>\n\t\t<name>Fix Sound Settings</name>\n\t\t<desc>ENG: Script to fix sound settings after an update of retropie.\nESP: Script para arreglar los ajustes de sonido despues de una actualizacion de retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install restore plymouth splashscreen fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoreplymouth.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/restoreplymouth.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/restoreplymouth.sh
if grep -q "restoreplymouth.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Pkymouth splascreen fix ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/restoreplymouth.sh</path>\n\t\t<name>Restore Plymouth splash</name>\n\t\t<desc>ENG: Script to restore Plymouth splashscreen after an update of retropie.\nESP: Script para restaurar el slplash Plymouth despues de una actualizacion de retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install launcher resolution menu fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/launcher-res.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/launcher-res.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/launcher-res.sh
if grep -q "launcher-res.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Launcher resolution menu fix ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/launcher-res.sh</path>\n\t\t<name>Launcher resolution menu</name>\n\t\t<desc>ENG: Menu to change the resolution of the kelboy launcher.\nESP: Menu para cambiar la resolucion del launcher de la kelboy.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
