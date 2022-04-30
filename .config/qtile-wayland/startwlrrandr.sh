#!/bin/bash

# Ignore sleep when run script from startwlrscreensaver.sh
if [ "${1}" == "screensaver" ] ; then
  echo "Load monitor configuration quickly"
else
  sleep 2
fi

# Configuration for your monitor(s). Use wlr-randr and/or wdisplays for help
wlr-randr --output DP-1 --custom-mode 1920x1200@60Hz --pos 288,0
wlr-randr --output DP-2 --custom-mode 1280x1024@75Hz --transform 90 --pos 1568,0
