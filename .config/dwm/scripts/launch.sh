#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Restore config for i3
#cp -rfv ~/.config/polybar/config.i3 ~/.config/polybar/config

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
  done
else
  polybar --reload mainbar-i3 -c ~/.config/polybar/config &
fi

# Launch bar1 and bar2
#polybar example &

#echo "Bars launched..."
