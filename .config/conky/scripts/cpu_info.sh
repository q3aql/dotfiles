#!/bin/sh

check_sensor=$(sensors | grep "Tdie:" 2> /dev/null)
if [ -z "${check_sensor}" ] ; then
  check_sensor=$(sensors | grep "Tctl:" 2> /dev/null)
  if [ -z "${check_sensor}" ] ; then
    CPU_USAGE=$(~/.config/conky/scripts/cpu_load.sh -p)
    echo "$CPU_USAGE" | awk '{printf("%6s \n"), $1, $2}' | tr -s " "
  else
    TEMP=$(sensors | grep 'Package id 0:\|Tctl' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
    #CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
    CPU_USAGE=$(~/.config/conky/scripts/cpu_load.sh -p)
    echo "$CPU_USAGE $TEMP" | awk '{printf("%6s @ %s \n"), $1, $2}' | tr -s " "
  fi
else
  TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
  #CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
  CPU_USAGE=$(~/.config/conky/iscripts/cpu_load.sh -p)
  echo "$CPU_USAGE $TEMP" | awk '{printf("%6s @ %s \n"), $1, $2}' | tr -s " "
fi
