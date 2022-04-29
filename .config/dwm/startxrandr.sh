#!/bin/bash

scan_rel=0

sleep 2
while [ ${scan_rel} -eq 0 ] ; do
  # Primer monitor
  xrandr --output DP-1 --mode 1920x1200 -r 59.95
  xrandr --output DisplayPort-0 --mode 1920x1200 -r 59.95
  # Segundo monitor
  xrandr --output DP-2 --mode 1280x1024 -r 75.02 --rotate left --right-of DP-1
  xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
  #xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --scale 1.1x1.1 --rotate left --right-of DisplayPort-0
  sleep 2
done
#sleep 2
#xrandr --output DisplayPort-0 --mode 1280x1024 -r 75.02
#xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
