#!/bin/bash

#cria arquivo autostart
#mkdir ~/.dwm
#touch ~/.dwm/autostart.sh


function requisites() {
  echo "Downloading Pre-requisites";
  sudo apt install neovim git make gcc libx11-dev libxft-dev libxinerama-dev picom;
}

function sucklesthings() {
    echo "Suckless";
    cd ~/.config;
    echo "DWM"
    git clone https://git.suckless.org/dwm
    cd dwm
    echo "dmenu"
    git clone https://git.suckless.org/dmenu
    echo "slstatus"
    git clone https://github.com/torrinfail/dwmblocks.git
}

function patches() {
    patch < patches/dwm-restartsig-20180523-6.2.diff 
    echo "patching";
    patch < patches/dwm-attachaside-6.1.diff
    patch < patches/dwm-fullgaps-6.4.diff
    patch < patches/dwm-autostart-20161205-bb3bd6f.diff 
    patch < patches/dwm-status2d-20200508-60bb3df.diff
}

function configs(){
    cp /.config/dwm.config.h ~/.config/dwm/
    cp /.config/dwm/slstatus/config.h /.config/dwm/slstatus/config.h
    cp -r /.dwm ~/
}

function make_install() {
    echo "dmenu"
    cd ~/.config/dwm/dmenu
    make
    sudo make install
    echo "slstatus"
    cd ~/.config/dwm/slstatus
    make
    sudo make install
    echo "DWM"
    cd ~/.config/dwm
    make
    sudo make install
    cd dwm
}


case "$1" in
    "") ;;
    dowload) "$@"; exit;;
    requisites) "$@"; exit;;
    sucklesthings) "$@"; exit;;
    patches) "$@"; exit;;
    make_install) "$@"; exit;;
    configs) "$@"; exit;;
    *) "Unkown function: $1()"; exit 2;;
esac

