#!/bin/bash

echo ""
echo ""
echo "Actualizando los paquetes del sistema..."
echo ""
echo ""
sleep 1
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sleep 2