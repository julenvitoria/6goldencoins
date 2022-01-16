#!/bin/bash

clear
cd /home/pi
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons ]; then
        echo "Directory update addons was created yet."
        echo "Updating Addons Menu..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
else
        echo "Creatings directory update addons."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
fi

#Install Addons Menu Updater
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/UpdateMenu.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
if grep -q "UpdateMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "UpdateMenu is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateMenu.sh</path>\n\t\t<name>Addons Menu Updater Script</name>\n\t\t<desc>ENG: Script to update addons menu.\nESP: Script para actualizar el menu addons.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Update and Upgrade System
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-UpdateUpgradeSystem/master/UpdateUpgradeSystem.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update and Upgrade System is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateUpgradeSystem.sh</path>\n\t\t<name>Update-Upgrade System packages</name>\n\t\t<desc>ENG: Script to Update and Upgrade System automatically (use at your own risk!!!)\nESP: Script para actualizar los paquetes del sistema de manera automatica (usar bajo tu responsabilidad!!!)</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Install Update Emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-emulators.cfg/main/UpdateEmulators.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
if grep -q "UpdateEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update Emulators is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateEmulators.sh</path>\n\t\t<name>Update Emulators.cfg file</name>\n\t\t<desc>ENG: Script to Update emulators.cfg file\nESP: Script para actualizar el archivo emulators.cfg</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Super Retroboy theme and launchings
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-SuperRetroBoyTheme/main/ThemePlusLaunchings.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/SRBtheme.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/SRBtheme.sh
if grep -q "SRBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SRBtheme is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/SRBtheme.sh</path>\n\t\t<name>SuperRetroBoy theme + Launchings</name>\n\t\t<desc>ENG: Script to install Super Retroboy theme by KALEL1981 and launchings per systems.\nESP: Script para instalar el tema Super Retro Boy de KALEL1981 y launchings de sistemas a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install SuperLopezGB theme and launchings
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-SuperLopezGBTheme/main/SLGBtheme.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/SLGBtheme.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/SLGBtheme.sh
if grep -q "SLGBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SLGBtheme is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/SLGBtheme.sh</path>\n\t\t<name>SuperLopezGB theme + Launchings</name>\n\t\t<desc>ENG: Script to install SuperLopezGB theme by mlopezmad and launchings per systems.\nESP: Script para instalar el tema SuperLopezGB de mlopezmad y launchings a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install N64HDTextures
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-N64HDTextures/master/N64HDTextures.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
if grep -q "N64HDTextures.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "N64HDTextures is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/N64HDTextures.sh</path>\n\t\t<name>Install N64 HD Textures</name>\n\t\t<desc>ENG: Script to install HD textures used with Mupen64Plus emulator.\nESP: Script para instalar texturas HD usadas con el emulador Mupen64Plus.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Configs and Remaps
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-ConfigsRemaps/main/ConfigsRemaps.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
if grep -q "ConfigRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Configs and Remaps is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/ConfigRemaps.sh</path>\n\t\t<name>Emulator Configs + Games Remaps</name>\n\t\t<desc>ENG: Script to install emulators configs and remaps for various games of various systems.\nESP: Script para instalar configuraciones de emuladores y mapeos de diversos juegos y sistemas.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install autostartmenu.sh 
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/autostartmenu.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/autostartmenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/autostartmenu.sh
if grep -q "autostartmenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Autostart menu is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/autostartmenu.sh</path>\n\t\t<name>Boot selection menu</name>\n\t\t<desc>ENG: Script to select through a menu to boot into Kelboy launcher, EmulationStation or Kodi. It could be neccessary to reselect after an update.\nESP: Script para seleccionar a traves de un menu si se desea iniciar en el launcher de la Kelboy, en EmulationStation o en Kodi. Podria ser necesario volver a seleccionarlo si se realiza alguna actualizacion.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install joymenu.sh 
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/joymenu.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/joymenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/joymenu.sh
if grep -q "joymenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Joy menu is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/joymenu.sh</path>\n\t\t<name>Analog Joy menu</name>\n\t\t<desc>ENG: Script to select through a menu enable/disable the analog joystick and invert X or Y axis. NOTE: The last two options only take effect if the Arduino Leonardo of your Kelboy has the last firmware that includes this capability.\nESP: Script para seleccionar a través de un menú habilitar/deshabilitar el joystick analógico e invertir los ejes X e Y. NOTA: Las dos últimas opciones solo tienen efecto si el Arduino Leonardo de tu Kelboy tiene el último firmware que incluye esta capacidad.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Create Fixes directory
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes ]; then
        echo "Directory fixes was created yet... Downloading fixes"
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
else
        echo "Creating directory fixes and Downloading them..."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
fi

#Install fixes!!
#Install gamelist & install fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/installgamelist.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Install with Gamelist fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/installgamelist.sh</path>\n\t\t<name>Reinstall addons menu with original retropie gamelist</name>\n\t\t<desc>ENG: Script to reinstall addons menu downloading original retropie gamelist (needed if addons names are changed in gamelist.xml).\nESP: Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si cambio los nombres de los addons en gamelist.xml).</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Restore systems fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoresystems.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/restoresystems.sh</path>\n\t\t<name>Restore systems</name>\n\t\t<desc>ENG: Script to restore aditional custom systems in es_systems.cfg after an update of the retropie setup script for example.\nESP: Script para restaurar sistemas personalizados adicionales en es_systems.cfg después de una actualización del script de configuración de retropie, por ejemplo.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install audio fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/audiofix.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
if grep -q "audiofix.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Audio fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/audiofix.sh</path>\n\t\t<name>Fix Sound Settings</name>\n\t\t<desc>ENG: Script to fix sound settings after an update of retropie.\nESP: Script para arreglar los ajustes de sonido despues de una actualizacion de retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install restore plymouth splashscreen fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoreplymouth.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoreplymouth.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoreplymouth.sh
if grep -q "restoreplymouth.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Pkymouth splascreen fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/restoreplymouth.sh</path>\n\t\t<name>Restore Plymouth splash</name>\n\t\t<desc>ENG: Script to restore Plymouth splashscreen after an update of retropie.\nESP: Script para restaurar el slplash Plymouth despues de una actualizacion de retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install launcher resolution menu fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/launcher-res.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/launcher-res.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/launcher-res.sh
if grep -q "launcher-res.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Launcher resolution menu fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/launcher-res.sh</path>\n\t\t<name>Launcher resolution menu</name>\n\t\t<desc>ENG: Menu to change the resolution of the kelboy launcher.\nESP: Menu para cambiar la resolucion del launcher de la kelboy.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
