#!/bin/bash

scan_rel=0
sleep 2

while [ ${scan_rel} -eq 0 ] ; do
  # Primer monitor
  xrandr --output DisplayPort-0 --mode 1280x1024 -r 75.02
  # Segundo monitor
  xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
  sleep 2
done

#xrandr --output Virtual1 --mode 1280x1024 -r 60.00
#xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
