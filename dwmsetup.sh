#!/bin/bash

#cria arquivo autostart
#mkdir ~/.dwm
#touch ~/.dwm/autostart.sh

dir_atual=$(pwd)
main="/dotfilesdwm/"
dirf=$dir_atual$main

function requisites() {
  echo "Downloading Pre-requisites";
  sudo apt install neovim git make gcc libx11-dev libxft-dev libxinerama-dev picom dunst feh lxappearance;
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
    echo "tiago"
    #git clone https://github.com/torrinfail/dwmblocks.git
    
}

function patches() {
# pertag centered
    cd $dirf
    echo "patching";
    patch < patches/dwm-restartsig-20180523-6.2.diff
    read -n 1 -s -r -p "Press any key to continue"
    #patch < patches/dwm-fullscreen-6.2.diff
    read -n 1 -s -r -p "Press any key to continue"
    patch < patches/dwm-attachaside-6.1.diff
    read -n 1 -s -r -p "Press any key to continue"
    patch < patches/dwm-fullgaps-6.4.diff
    read -n 1 -s -r -p "Press any key to continue"
    patch < patches/dwm-autostart-20161205-bb3bd6f.diff 
    read -n 1 -s -r -p "Press any key to continue"
    patch < patches/dwm-status2d-20200508-60bb3df.diff
    read -n 1 -s -r -p "Press any key to continue"
#mudar na mão o que falhou
}

function configs(){
    cd $dirf
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

function notification() {
    cd $dirf
    cp .config/dunst .config/
}

function fonts() {
    cd $dirf
    cp .config/Powerline-font .loca/share/fonts
    fc-cache -fv
}

case "$1" in
    "") ;;
    dowload) "$@"; exit;;
    requisites) "$@"; exit;;
    sucklesthings) "$@"; exit;;
    patches) "$@"; exit;;
    make_install) "$@"; exit;;
    configs) "$@"; exit;;
    notification) "$@"; exit;;
    fonts) "$@"; exit;;
    *) "Unkown function: $1()"; exit 2;;
esac

