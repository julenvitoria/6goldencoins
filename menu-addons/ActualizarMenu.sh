#!/bin/bash

clear
cd /home/pi
if [ -d /home/pi/RetroPie/retropiemenu/#Menu-Addons ]; then
        echo "Directory update addons was created yet."
        echo "Updating Addons Menu..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/#Menu-Addons
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons
else
        echo "Creatings directory update addons."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons
fi

#Instalar al actualizador del menu de addons
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/ActualizarMenu.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh
if grep -q "ActualizarMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El actualizador de Menu-Addons ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ActualizarMenu.sh</path>\n\t\t<name>Addons Menu Updater Script</name>\n\t\t<desc>ENG: Script to update addons menu.\nESP: Script para actualizar el menu addons.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar el actualizador del sistema
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/UpdateUpgrade.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgrade.sh
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script para hacer update y upgrade al sistema ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateUpgrade.sh</path>\n\t\t<name>Update-Upgrade System packages</name>\n\t\t<desc>ENG: Script to Update and Upgrade System automatically (use at your own risk!!!)\nESP: Script para actualizar los paquetes del sistema de manera automatica (usar bajo tu responsabilidad!!!)</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Instalar actualizador emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/ActualizarEmulators.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarEmulators.sh
if grep -q "ActualizarEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script para actualizar el archivo emulators.cfg ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateEmulators.sh</path>\n\t\t<name>Update Emulators.cfg file</name>\n\t\t<desc>ENG: Script to Update emulators.cfg file\nESP: Script para actualizar el archivo emulators.cfg</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Configs and Remaps
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-ConfigsRemaps/main/ConfigsRemaps.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigRemaps.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigRemaps.sh
if grep -q "ConfigRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Configs and Remaps ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ConfigRemaps.sh</path>\n\t\t<name>Emulator Configs + Games Remaps</name>\n\t\t<desc>ENG: Script to install emulators configs and remaps for various games of various systems.\nESP: Script para instalar configuraciones de emuladores y mapeos de diversos juegos y sistemas.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Create Fixes directory
if [ -d /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes ]; then
        echo "Directory fixes was created yet... Downloading fixes"
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
else
        echo "Creating directory fixes and Downloading them..."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes
fi

#Install fixes!!
#Install gamelist & install fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/installgamelist.sh>/home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/installgamelist.sh
chmod +x /home/pi/RetroPie/retropiemenu/#Menu-Addons/Fixes/installgamelist.sh
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Install with Gamelist fix ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/Fixes/installgamelist.sh</path>\n\t\t<name>Reinstall addons menu with original retropie gamelist</name>\n\t\t<desc>ENG: Script to reinstall addons menu downloading original retropie gamelist (needed if addons names are changed in gamelist.xml).\nESP: Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si cambio los nombres de los addons en gamelist.xml).</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
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
