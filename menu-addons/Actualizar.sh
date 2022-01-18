#!/bin/bash

clear
cd /home/pi
if [ -d '/home/pi/RetroPie/retropiemenu/#Menu-Addons' ]; then
        echo "Directorio Menu-Addons ya fue creado anteriormente."
        echo "Actualizando Menu-Addons..."
        sleep 2
        rm -R '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
else
        echo "Creando directorio Menu-Addons e instalando..."
        sleep 2
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
fi

#Añadir menu addons al gamelist del menu retropie
if grep -q "#15.Menu addons" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El Menu-Addons ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<folder>\n\t\t<path>./#Menu-Addons/</path>\n\t\t<name>#15.Menu addons</name>\n\t\t<desc>Acceso al menú Addons donde podrá ver diferentes opciones para realizar diversas operaciones. ¡¡¡ ATENCION IMPORTANTE: ES NECESARIO TENER CONEXION A INTERNET PARA EL CORRECTO FUNCIONAMIENTO DE ESTE MENU!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/Menu.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</folder>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Añadir menu fixes al gamelist del menu retropie
if grep -q "#Fixes" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El Menu Fixes ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<folder>\n\t\t<path>./#Menu-Addons/#fixes</path>\n\t\t<name>#Fixes</name>\n\t\t<desc>Acceso al menú Fixes. ¡¡¡ ATENCION IMPORTANTE: LEER LA DESCRIPCION DE CADA FIX AL IR A EJECUTARLO, PODRIA DAÑAR ALGO SI NO SE UTILIZA DE MANERA CORRECTA!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/Fixes.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</folder>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar al actualizador del menu de addons
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ActualizarMenu.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh'
if grep -q "ActualizarMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El actualizador de Menu-Addons ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ActualizarMenu.sh</path>\n\t\t<name>Actualizar este menu</name>\n\t\t<desc>Script para actualizar el menu addons. Aparte de realizar cambios en los scripts tambien es posible que aparezcan nuevas opciones despues de actualizar.</desc>\n\t\t<image>./#Menu-Addons/iconos/ActualizarMenu.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar el actualizador del sistema
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/UpdateUpgrade.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh'
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script update y upgrade al sistema ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateUpgradeSystem.sh</path>\n\t\t<name>Actualizar sistema operativo</name>\n\t\t<desc>Script para actualizar los paquetes del sistema de manera con un solo click ¡¡¡ATENCION: USA BAJO TU PROPIA RESPONSABILIDAD!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/UpdateUpgrade.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Instalar actualizador emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ActualizarEmulators.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh'
if grep -q "ActualizarEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script para actualizar el archivo emulators.cfg ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateEmulators.sh</path>\n\t\t<name>Descargar emulators.cfg original</name>\n\t\t<desc>Script para descargar el archivo emulators.cfg original de la imagen. Esto significa qur tambien cambiara en el caso de que se realice algun cambio para mejorar la emulacion en algun juego. ¡¡¡ATENCION: Si has realizado cambios en la eleccion de emuladores y ejecutas esta operacion perderas dichos cambios si no existen en el archivo descargado. En este caso se recomienda realizar una copia de seguridad antes de ejecutarlo!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/UpdateEmulators.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar ConfigsRemaps
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/ConfigsRemaps.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh'
if grep -q "ConfigsRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "ConfigsRemaps ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ConfigsRemaps.sh</path>\n\t\t<name>Configuraciones y remapeos</name>\n\t\t<desc>Script para descargar/actualizar configuraciones de emuladores y mapeos de diversos juegos y sistemas. ¡¡¡ATENCION: Si has realizado cambios en las configuraciones o remapeos y ejecutas esta operacion perderas dichos cambios si al descargarse se machacan los archivos. En este caso se recomienda realizar una copia de seguridad antes de ejecutarlo!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/ConfigsRemaps.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar restaurar sistemas
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/restoresystems.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/restoresystems.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/restoresystems.sh'
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/restoresystems.sh</path>\n\t\t<name>Restaurar sistemas de EmulationStation</name>\n\t\t<desc>Script para instalar/restaurar sistemas personalizados adicionales en es_systems.cfg después de por ejemplo una actualización a traves de retropie-setup. ¡¡¡ATENCION: SI SE HAN HECHO CAMBIOS ADICIONALES EN EL ARCHIVO es_systems.cfg UBICADO EN /opt/retropie/configs/all/emulationstation SE PERDERAN A EJECUTARSE ESTA OPCION PORQUE SE MACHACARA CON EL QUE SE DESCARGUE!!! Se recomienda realizar uñas copia de seguridad antes de ejecutar esta operación.</desc>\n\t\t<image>./#Menu-Addons/iconos/restoresystems.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Crear directorio de fixes
if [ -d '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes' ]; then
        echo "Directorio fixes ya fue creado anteriormente... Borrando y descargando de nuevo..."
        sleep 2
        rm -R '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
else
        echo "Creando directorio Fixes y descargándolos..."
        sleep 2
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
fi

#Instalar fix installgamelist
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins/main/menu-addons/installgamelist.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/installgamelist.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/installgamelist.sh'
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix installgamelist ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/installgamelist.sh</path>\n\t\t<name>Reinstalar Menu-Addons con gamelist original de retropie</name>\n\t\t<desc>Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si cambio los nombres de los addons en gamelist.xml).</desc>\n\t\t<image>./#Menu-Addons/iconos/installgamelist.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#crear directorio de iconos y descargar
cd '/home/pi/RetroPie/retropiemenu/#Menu-Addons/'
echo "Descargando iconos del menu addons..."
sleep 2
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins/tree/master/menu-addons/iconos
fi

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
