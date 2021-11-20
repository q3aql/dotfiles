#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  # Disable show meminfo 
  #mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  #echo -e "$mem"

  # Enable meminfo in GiB
  memfile="/proc/meminfo"
  size="G" # Change to M for MiB

  # Variables
  memTotal=$(cat ${memfile} | grep -i "memtotal:" | head -1 | tr -s " " | cut -d " " -f 2)
  memActive=$(cat ${memfile} | grep -i "memavailable:" | head -1 | tr -s " " | cut -d " " -f 2)
  memActive=$(expr ${memTotal} - ${memActive})

  # Variables to calculate
  memTotalM=$(expr ${memTotal} / 1024 )
  memActiveM=$(expr ${memActive} / 1024)
  memTotalG=$(calc ${memTotalM} / 1024 | tr -s " " | cut -c1-5)
  memActiveG=$(calc ${memActiveM} / 1024 | tr -s " " | cut -c1-5)

  # Variables to show
  if [ "${size}" == "G" ] ; then
	  showMemTotal="${memTotalG}G"
	  showMemActive="${memActiveG}G"
  elif [ "${size}" == "M" ] ; then
	  showMemTotal="${memTotalM}M"
	  showMemActive="${memActiveM}M"
  else
	  showMemTotal="${memTotalG}G"
	  showMemActive="${memActiveG}G"
  fi

  show_mem_bar=$(echo ${showMemActive} /${showMemTotal})
  echo -e ${show_mem_bar} | tr -s " "
}

## DATE AND TIME
date_today() {
  day_hour=$(date "+%a,%d %h [%H:%M]")
  echo -e "${day_hour}"
}

## DATE AND TIME (CUT)
date_today_cut() {
  day_hour=$(date "+%H:%M")
  echo -e "${day_hour}"
}

# KERNEL
kernel() {  
  # Parameters
  longNumber=2
  kernelCommand="uname -r"

  # Kernel version
  kernelVersion=""
  count=1
  # Extract numbers of kernel version
  kernelVersionTemp=$(uname -r | cut -d "." -f ${count})
      kernelVersionTempDot="${kernelVersionTemp}"
      kernelVersion="${kernelVersion}${kernelVersionTempDot}"
      count=$(expr ${count} + 1)
  while [ ${count} -le ${longNumber} ] ; do
      kernelVersionTemp=$(uname -r | cut -d "." -f ${count})
      kernelVersionTempDot=".${kernelVersionTemp}"
      kernelVersion="${kernelVersion}${kernelVersionTempDot}"
      count=$(expr ${count} + 1)
  done
  kernelVersionTemp=$(uname -r | cut -d "." -f ${count} | cut -d "-" -f 1)
  kernelVersionTempDot=".${kernelVersionTemp}"
  kernelVersion=${kernelVersion}${kernelVersionTempDot}
  # Apply arch
  kernelVersion=${kernelVersion}
  echo -e "Linux ${kernelVersion}"
}

## CPU
cpu() {
  TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu% @ ${TEMP}"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
    echo -e "VOL: $vol"
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "+@fg=5; $(kernel) +@fg=0; | +@fg=1; $(cpu) +@fg=0; | +@fg=2; $(mem) +@fg=0; | +@fg=3; $(hdd) +@fg=0; | +@fg=4; $(vol) +@fg=0; | +@fg=5; $(date_today_cut) +@fg=0;" 
    #echo "+@fg=5; $(kernel) +@fg=0; | +@fg=1; $(cpu) +@fg=0; | +@fg=2; $(mem) +@fg=0; | +@fg=3; $(hdd) +@fg=0; | +@fg=4; $(vol) +@fg=0; | +@fg=5; $(date_today) +@fg=0;" 
    #echo "+@fg=5; +@fn=1;+@fn=0; $(kernel) +@fg=0; | +@fg=1; +@fn=1;💻+@fn=0; $(cpu) +@fg=0; | +@fg=2; +@fn=1;💾+@fn=0; $(mem) +@fg=0; | +@fg=3; +@fn=1;💿+@fn=0; $(hdd) +@fg=0; | +@fg=4; +@fn=1;🔈+@fn=0; $(vol) +@fg=0; |"
	sleep $SLEEP_SEC
done
