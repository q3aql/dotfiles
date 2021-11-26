#!/bin/bash

# Detect running process tint2
check_process2=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 2 | head -1)
check_process3=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 3 | head -1)
check_process4=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 4 | head -1)
check_process5=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 5 | head -1)
check_process6=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 6 | head -1)
check_process7=$(ps -e | grep tint2 | tr -s " " | cut -d " " -f 7 | head -1)

if [ "${check_process2}" == "tint2" ] ; then
  killall -9 tint2
elif [ "${check_process3}" == "tint2" ] ; then
  killall -9 tint2
elif [ "${check_process4}" == "tint2" ] ; then
  killall -9 tint2
elif [ "${check_process5}" == "tint2" ] ; then
  killall -9 tint2
elif [ "${check_process6}" == "tint2" ] ; then
  killall -9 tint2
elif [ "${check_process7}" == "tint2" ] ; then
  killall -9 tint2
else
  G_SLICE=always-malloc
  killall -9 pnmixer
  killall -9 nm-applet
  killall -9 diodon
  killall -9 conmman-gtk
  ~/.config/spectrwm/autostart.sh &
  tint2 -c ~/.config/spectrwm/tint2rc &
fi

