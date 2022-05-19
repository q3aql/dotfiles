#!/bin/sh

check_sensor=$(sensors | grep "edge:" 2> /dev/null)
if [ -z "${check_sensor}" ] ; then
  check_sensor=$(sensors | grep "junction:" 2> /dev/null)
  if [ -z "${check_sensor}" ] ; then
    echo "N/A°C" 
  else
    TEMP=$(sensors | grep 'Package id 0:\|edge' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
    echo "$TEMP"
  fi
else
  TEMP=$(sensors | grep 'Package id 0:\|junction' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
  echo "$TEMP"
fi
