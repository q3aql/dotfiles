#!/bin/bash

# Script to show meminfo
# Created by q3aql (q3aql@duck.com)
# Licensed by GPL v.2
# Date: 10-01-2020
# --------------------------------------
VERSION="1.0"

# Configuration variables
memfile="/proc/meminfo"
size="G" # Change to M for MiB

# Check if calc is installed
calc -version &> /dev/null
error=${?}
if [ ${error} -ne 0 ] ; then
	echo ""
	echo " meminfo v$VERSION"
	echo " ------------"
	echo ""
	echo " The command 'calc' is not installed!"
	echo ""
	echo " You can install it with:"
	echo "   sudo apt-get install apcalc"
	echo ""
	exit
fi

# Variables
memTotal=$(cat ${memfile} | grep -i "memtotal:" | head -1 | tr -s " " | cut -d " " -f 2)
memActive=$(cat ${memfile} | grep -i "memavailable:" | head -1 | tr -s " " | cut -d " " -f 2)
memActive=$(expr ${memTotal} - ${memActive})

# Variables to calculate
memTotalM=$(expr ${memTotal} / 1024 )
memActiveM=$(expr ${memActive} / 1024)
memPercentage=$(calc ${memActive} / ${memTotal} \* 100)
memTotalG=$(calc ${memTotalM} / 1024 | tr -s " " | cut -c1-5)
memActiveG=$(calc ${memActiveM} / 1024 | tr -s " " | cut -c1-5)

# Variables to show
showMemPercentage=$(echo ${memPercentage} | cut -d "~" -f 2 | cut -d "." -f 1)
if [ "${size}" == "G" ] ; then
	showMemTotal="${memTotalG} GiB"
	showMemActive="${memActiveG} GiB"
elif [ "${size}" == "M" ] ; then
	showMemTotal="${memTotalM} MiB"
	showMemActive="${memActiveM} MiB"
else
	showMemTotal="${memTotalG} GiB"
	showMemActive="${memActiveG} GiB"
fi

# Show percentage bar
if [ ${showMemPercentage} -ge 3 ] ; then
	showMemPercentageBar="="
fi
if [ ${showMemPercentage} -ge 12 ] ; then
	showMemPercentageBar="==="
fi
if [ ${showMemPercentage} -ge 25 ] ; then
	showMemPercentageBar="====="
fi
if [ ${showMemPercentage} -ge 35 ] ; then
	showMemPercentageBar="======"
fi
if [ ${showMemPercentage} -ge 40 ] ; then
	showMemPercentageBar="======="
fi
if [ ${showMemPercentage} -ge 45 ] ; then
	showMemPercentageBar="========"
fi
if [ ${showMemPercentage} -ge 50 ] ; then
	showMemPercentageBar="=========="
fi
if [ ${showMemPercentage} -ge 62 ] ; then
	showMemPercentageBar="============="
fi
if [ ${showMemPercentage} -ge 75 ] ; then
	showMemPercentageBar="==============="
fi
if [ ${showMemPercentage} -ge 85 ] ; then
	showMemPercentageBar="================="
fi
if [ ${showMemPercentage} -ge 90 ] ; then
	showMemPercentageBar="=================="
fi
if [ ${showMemPercentage} -ge 95 ] ; then
	showMemPercentageBar="==================="
fi
if [ ${showMemPercentage} -ge 100 ] ; then
	showMemPercentageBar="===================="
fi

# Show results
if [ "$1" == "-t" ] ; then
	echo ${showMemTotal}
elif [ "$1" == "-a" ] ; then
	echo ${showMemActive}
elif [ "$1" == "-p" ]; then
	echo ${showMemPercentage}%
elif [ "$1" == "-b" ]; then
	echo ${showMemPercentageBar}
else
	showMemTotalNoSpaces=$(echo ${showMemTotal})
	showMemActiveNoSpaces=$(echo ${showMemActive})
	echo ""
	echo " meminfo v$VERSION"
	echo " ------------"
	echo ""
	echo " MemTotal = ${showMemTotalNoSpaces}"
	echo " MemActive = ${showMemActiveNoSpaces}"
	echo ""
	echo " MemPercentage Use:"
	echo " ${showMemPercentageBar} ${showMemPercentage}%"
	echo ""
	echo " Available commands:"
	echo ""
	echo " meminfo.sh -t | Show MemTotal"
	echo " meminfo.sh -a | Show MemActive"
	echo " meminfo.sh -p | Show MemPercentage"
	echo " meminfo.sh -b | Show MemPercentage Bar"
	echo ""
	echo " Note: Conky require 'maximum_width = 240'"
	echo ""
fi
