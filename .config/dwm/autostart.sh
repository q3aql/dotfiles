#!/bin/bash

# Load top bar (Optional)
#dwmblocks &

# Network applet
#connman-gtk --tray &
nm-applet &

# Applet for Audio
pnmixer -t &

# Configure screens and resolution
~/.config/dwm/startxrandr.sh &

# Load compton or picom
#compton &
#sleep 15 && picom &

# Configure wallpaper
wallpaper_path="${HOME}/wallpapers/awesome.jpg"
#sleep 5 && nitrogen --head=0 --set-scaled ${wallpaper_path} &
sleep 5 && nitrogen --head=0 --set-scaled ${wallpaper_path} ; nitrogen --head=1 --set-zoom-fill ${wallpaper_path} &

# Configure screensaver
~/.config/dwm/startscreensaver.sh &

# Clipboard (Diodon)
diodon &

# Load Conky
sleep 10 && conky -c ~/.config/conky/conkyrc_dwm &
