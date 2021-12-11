#!/bin/bash

scan_rel=0

sleep 2
#while [ ${scan_rel} -eq 0 ] ; do
  # Primer monitor
  #wlr-randr --output DP-1 --custom-mode 1280x1024@75Hz --pos 288,0
  # Segundo monitor
  #wlr-randr --output DP-2 --custom-mode 1280x1024@75Hz --transform 90 --pos 1568,0
  #sleep 2
#done
sleep 2
wlr-randr --output DP-1 --custom-mode 1280x1024@75Hz --pos 288,0
wlr-randr --output DP-2 --custom-mode 1280x1024@75Hz --transform 90 --pos 1568,0
