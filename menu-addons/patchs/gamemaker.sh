#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="gamemaker"
rp_module_desc="GameMaker - Games for the Raspberry Pi"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_gamemaker() {
    getDepends libopenal-dev
}

function install_bin_gamemaker() {
    # Install Maldita Castilla Game
    wget https://github.com/julenvitoria/6goldencoins/raw/main/menu-addons/patchs/gamemaker.zip
    unzip gamemaker.zip -d "$md_inst"
    chmod +x "$md_inst"/MalditaCastilla/MalditaCastilla
    rm gamemaker.zip
    
    patchVendorGraphics "$md_inst/MalditaCastilla/MalditaCastilla"
}

function configure_gamemaker() {
    mkRomDir "ports"

    addPort "$md_id" "MalditaCastilla" "MalditaCastilla" "$md_inst/MalditaCastilla/MalditaCastilla"
}
