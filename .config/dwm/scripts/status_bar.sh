#!/bin/bash

status_bar=0

while [ ${status_bar} -eq 0 ] ; do
  updates=$(~/.config/dwm/scripts/checkUpdates.sh)
  kernel=$(~/.config/dwm/scripts/kernel_version.sh)
  cpuinfo=$(~/.config/dwm/scripts/cpu_info.sh)
  meminfo=$(~/.config/dwm/scripts/mem_info.sh)
  volume=$(~/.config/dwm/scripts/get_volume.sh)
  date=$(~/.config/dwm/scripts/current_date.sh)
  #echo "${updates} ${kernel} ${cpuinfo} ${meminfo} ${volume} ${date}"
  xsetroot -name "${updates} ${kernel} ${cpuinfo} ${meminfo} ${volume} ${date}"
  sleep 2
done
