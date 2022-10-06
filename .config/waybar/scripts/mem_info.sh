#!/bin/bash

# Configuration variables
memfile="/proc/meminfo"
size="G" # Change to M for MiB

# Variables
memTotal=$(cat ${memfile} | grep -i "memtotal:" | head -1 | tr -s " " | cut -d " " -f 2)
memActive=$(cat ${memfile} | grep -i "memavailable:" | head -1 | tr -s " " | cut -d " " -f 2)
memActive=$(expr ${memTotal} - ${memActive})

# Variables to calculate
memTotalM=$(expr ${memTotal} / 1024 )
memActiveM=$(expr ${memActive} / 1024)
if [ -f /usr/bin/calc ] ; then
  memPercentage=$(calc ${memActive} / ${memTotal} \* 100)
  memTotalG=$(calc ${memTotalM} / 1024 | tr -s " " | cut -c1-5)
  memActiveG=$(calc ${memActiveM} / 1024 | tr -s " " | cut -c1-5)
else
  memPercentage=$(expr ${memActive} / ${memTotal} \* 100)
  memTotalG=$(expr ${memTotalM} / 1024 | tr -s " " | cut -c1-5)
  memActiveG=$(expr ${memActiveM} / 1024 | tr -s " " | cut -c1-5)
fi

# Variables to show
showMemPercentage=$(echo ${memPercentage} | cut -d "~" -f 2 | cut -d "." -f 1)
if [ "${size}" == "G" ] ; then
  showMemTotal="${memTotalG}Gi"
  showMemActive="${memActiveG}Gi"
elif [ "${size}" == "M" ] ; then
  showMemTotal="${memTotalM}Mi"
  showMemActive="${memActiveM}Mi"
else
  showMemTotal="${memTotalG}Gi"
  showMemActive="${memActiveG}Gi"
fi

memshowactive=$(echo ${showMemActive})
memshowtotal=$(echo ${showMemTotal})
echo " ${memshowactive} / ${memshowtotal}"
