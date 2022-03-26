#!/bin/bash

clear
echo ""
echo ""
echo ""
if [ ! "`ping -c 1 github.com`" ]
then
  echo "No hay conexion con GitHub.com"
  sleep 3
  exit 0
fi

echo "Conexion con GitHub.com establecida, continuando..."
sleep 2
if [ -d "/home/pi/scripts/tmp/" ]; then
    echo "Borrando directorio temporal..."
    echo ""
    rm -r "/home/pi/scripts/tmp/"
    sleep 1
fi
echo "Descargando fix DOSBox y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins/tree/master/menu-addons/patchs/dosbox/
cd dosbox
cp -R DOSBox /opt/retropie/configs/all/retroarch/config/
cp dr.cfg /home/pi/RetroPie/roms/msdos/Death_Rally/
cd ~
rm -r "/home/pi/scripts/tmp/"
rm /opt/retropie/configs/all/retroarch/config/DOSBox/DOSBox.opt
#echo "config_save_on_exit = \"true\"" > /opt/retropie/configs/all/retroarch/config/DOSBox/DOSBox.cfg
cp /home/pi/RetroPie/roms/pc/INSTALL.SYS /home/pi/RetroPie/roms/msdos
sed -i 's|.*input_remapping_directory.*|input_remapping_directory = "/opt/retropie/configs/pc/"|' /opt/retropie/configs/pc/retroarch.cfg
sed -i 's|.*dosbox_pcspeaker =.*|dosbox_pcspeaker = "true"|' /opt/retropie/configs/pc/retroarch-core-options.cfg
sleep 2
