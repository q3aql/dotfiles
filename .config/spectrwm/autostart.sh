#!/bin/bash

sleep 1

# Clipboard (Use Win + Shift + t to show it)
diodon &

# Audio tray
pnmixer -t &

# Network Tray (Use Win + Shift + t to show it)
#nm-applet &
connman-gtk --tray &
