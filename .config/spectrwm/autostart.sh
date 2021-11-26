#!/bin/bash

#sleep 5

# Clipboard (Use Win + Shift + t to show it)
diodon &

# Audio tray
pnmixer -t &

# Network Tray (Use Win + Shift + t to show it)
nm-applet &
#connman-gtk --tray &
