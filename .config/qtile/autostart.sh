#!/bin/sh

# Network applet
#connman-gtk --tray &
nm-applet

# Applet for Audio
pnmixer -t &

# Configure screens and resolution
~/.config/qtile/startxrandr.sh &

# Load compton or picom
#compton &
#sleep 15 && picom &

# Configure wallpaper
sleep 3 && nitrogen --head=0 --set-scaled ~/wallpapers/archlinux2.jpg
nitrogen --head=1 --set-zoom-fill ~/wallpapers/archlinux2.jpg

# Configure screensaver
~/.config/qtile/startscreensaver.sh &

# Clipboard (Diodon)
diodon &

# Load Conky
sleep 10 && conky -c ~/.config/conky/conkyrc_qtile &
