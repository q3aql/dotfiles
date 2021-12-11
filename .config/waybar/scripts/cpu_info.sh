#!/bin/sh
TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
#CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
CPU_USAGE=$(~/.config/i3blocks/cpu/cpu_load.sh -p)
echo "$CPU_USAGE $TEMP" | awk '{ printf(" CPU:%6s @ %s \n"), $1, $2 }'
