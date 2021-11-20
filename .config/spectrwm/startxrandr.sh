#!/bin/bash

scan_rel=0
sleep 3

while [ ${scan_rel} -eq 0 ] ; do
  # Primer monitor
  xrandr --output Virtual1 --mode 1280x1024 -r 60.00
  # Segundo monitor
#  xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
  sleep 1
done
#sleep 2
#xrandr --output Virtual1 --mode 1280x1024 -r 60.00
#xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
