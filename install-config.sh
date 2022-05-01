#!/bin/bash

current_dir=$(pwd)
echo ""
echo "# Copying files to home ${HOME}"
cd ${current_dir}
cp -rf * ${HOME}
cp -rf .bash* ${HOME}/
cp -rf .zsh* ${HOME}/
cp -rf .conky* ${HOME}/
cp -rf .config* ${HOME}/
cp -rf .vim* ${HOME}/
cp -rf .Xresources ${HOME}/
rm -rfv ~/.local/share/dwm/autostart.sh 2> /dev/null
mkdir -p ~/.local/share/dwm
ln -s ~/.config/dwm/autostart.sh ~/.local/share/dwm
echo "# Removing unnecesary files"
sleep 2
rm -rf ${HOME}/README.md
rm -rf ${HOME}/README-i3.md
rm -rf ${HOME}/README-spectrwm.md
rm -rf ${HOME}/README-sway.md
rm -rf ${HOME}/README-qtile.md
rm -rf ${HOME}/README-dwm.md
rm -rf ${HOME}/Dependencies.md
rm -rf ${HOME}/install-config.sh
echo "# Config files installed!"


