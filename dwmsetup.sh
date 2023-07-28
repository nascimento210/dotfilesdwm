#!/bin/bash

sudo apt install neovim git make gcc libx11-dev libxft-dev libxinerama-dev picom

cd ~/.config
 
git clone https://git.suckless.org/dwm

cd dwm

git clone https://git.suckless.org/dmenu

git clone https://github.com/torrinfail/dwmblocks.git

# adiciona patche e compila

patch < dwm-fullgaps-6.4.diff
patch < dwm-fullgaps-6.4.diff
patch < dwm-autostart-20161205-bb3bd6f.diff 
patch < dwm-fullgaps-6.4.diff 

make
sudo make install

#entra em cada aplicativo adicional e da make e make intall

cd ~/.config/dwm/dmenu
make
sudo make install

cd ~/.config/dwm/dwmblocks
make
sudo make install

#cria arquivo autostart
#mkdir ~/.dwm
#touch ~/.dwm/autostart.sh

