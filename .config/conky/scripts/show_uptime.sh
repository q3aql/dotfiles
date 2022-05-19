#!/bin/bash

if [ -f /proc/uptime ] ; then
  uptime_sec=$(cat /proc/uptime)
  uptime_sec_cut=$(echo ${uptime_sec} | tr -s " " | cut -d " " -f 1 | cut -d "." -f 1)
  uptime_min=$(expr ${uptime_sec_cut} / 60)
  if [ ${uptime_min} -le 59 ] ; then
    uptime="${uptime_min}min"
  else
    uptime_hour=$(expr ${uptime_min} / 60)
    if [ ${uptime_hour} -le 23 ] ; then
      uptime="${uptime_hour}h"
    else
      uptime_day=$(expr ${uptime_hour} / 24)
      uptime="${uptime_day}d"
    fi
  fi
else
  uptime=$(uptime 2> /dev/null | tr -s " " | cut -d "," -f 1)
  if [ -z "${uptime}" ] ; then
    uptime="Unknown"
  else
    uptime=$(echo ${uptime})
  fi
fi

echo "${uptime}"
