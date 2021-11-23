#!/bin/bash

scan_rel=0

while [ ${scan_rel} -eq 0 ] ; do
  # Primer monitor
  xrandr --output DisplayPort-0 --mode 1280x1024 -r 75.02
  # Segundo monitor
  xrandr --output DisplayPort-1 --mode 1280x1024 -r 75.02 --rotate left --right-of DisplayPort-0
  sleep 2
done
