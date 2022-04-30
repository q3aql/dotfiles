#!/bin/sh

# Autostart script for Qtile
cmd_exist() { unalias "$1" >/dev/null 2>&1 ; command -v "$1" >/dev/null 2>&1 ;}
__kill() { kill -9 "$(pidof "$1")" >/dev/null 2>&1 ; }
__start() { sleep 1 && "$@" >/dev/null 2>&1 & }
__running() { pidof "$1" >/dev/null 2>&1 ;}

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# Authentication dialog
if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
fi

# Notification daemon
#dunst &

# Network applet
#connman-gtk --tray &
nm-applet

# Applet for Audio
pnmixer -t &

# Configure screens and resolution
~/.config/qtile/startwlrrandr.sh &

# Configure screensaver
~/.config/qtile/startwlrscreensaver.sh &

# Clipboard (Diodon)
diodon &

