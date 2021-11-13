#!/bin/bash

# Script to show hdd info
# Created by q3aql (q3aql@duck.com)
# Licensed by GPL v.2
# Date: 10-01-2020
# --------------------------------------
VERSION="1.0"

# Check if folder option is empty
if [ -z "${1}" ] ; then
	echo ""
	echo " hddinfo v$VERSION"
	echo " ------------"
	echo ""
	echo " Sintax:"
	echo ""
	echo " hddinfo.sh <device or folder> -t | Show HddTotal Size"
	echo " hddinfo.sh <device or folder> -u | Show HddUsed Size"
	echo " hddinfo.sh <device or folder> -p | Show HddPercentage Use"
	echo " hddinfo.sh <device or folder> -b | Show HddPercentage Bar"
	echo ""
	echo " hddinfo.sh -l | List of available folders/devices"
	echo ""
	echo " Note: Conky require 'maximum_width = 240'"
	echo ""
	exit
fi

# Create list of available devices
if [ "${1}" == "-l" ] ; then
	numberDevices=$(df -h | wc -l)
	listAvailableDevices=$(df -h | tr -s " " | cut -d " " -f 6)
	count=2
	fileDevices=/tmp/listDevicesHddInfo
	echo "" > ${fileDevices}
	while [ ${numberDevices} -ge ${count} ] ; do
		device=$(df -h | tr -s " " | head -${count} | tail -1 | cut -d " " -f 1)
		folder=$(df -h | tr -s " " | head -${count} | tail -1 | cut -d " " -f 6)
		echo -n " ${device}" >> ${fileDevices}
		echo -n " on" >> ${fileDevices}
		echo " ${folder}" >> ${fileDevices}
		count=$(expr ${count} + 1)
	done
	echo ""
	echo " hddinfo v$VERSION"
	echo " ------------"
	echo ""
	echo " List of available devices/folders:"
	cat "${fileDevices}"
	echo ""
	exit
fi

# Variables
HddTotal=$(df -h | tr -s " " | grep -e "${1}" | cut -d " " -f 2)
HddUsed=$(df -h | tr -s " " | grep -e "${1}" | cut -d " " -f 3)
HddPercentage=$(df -h | tr -s " " | grep -e "${1}" | cut -d " " -f 5)
HddPercentageInteger=$(echo ${HddPercentage} | cut -d "%" -f 1)

# Show percentage bar
if [ ${HddPercentageInteger} -ge 0 ] ; then
	HddPercentageBar="="
fi
if [ ${HddPercentageInteger} -ge 3 ] ; then
	HddPercentageBar="=="
fi
if [ ${HddPercentageInteger} -ge 12 ] ; then
	HddPercentageBar="==="
fi
if [ ${HddPercentageInteger} -ge 18 ] ; then
	HddPercentageBar="===="
fi
if [ ${HddPercentageInteger} -ge 25 ] ; then
	HddPercentageBar="====="
fi
if [ ${HddPercentageInteger} -ge 35 ] ; then
	HddPercentageBar="======"
fi
if [ ${HddPercentageInteger} -ge 40 ] ; then
	HddPercentageBar="======="
fi
if [ ${HddPercentageInteger} -ge 45 ] ; then
	HddPercentageBar="========"
fi
if [ ${HddPercentageInteger} -ge 50 ] ; then
	HddPercentageBar="=========="
fi
if [ ${HddPercentageInteger} -ge 62 ] ; then
	HddPercentageBar="============="
fi
if [ ${HddPercentageInteger} -ge 75 ] ; then
	HddPercentageBar="==============="
fi
if [ ${HddPercentageInteger} -ge 85 ] ; then
	HddPercentageBar="================="
fi
if [ ${HddPercentageInteger} -ge 90 ] ; then
	HddPercentageBar="=================="
fi
if [ ${HddPercentageInteger} -ge 95 ] ; then
	HddPercentageBar="==================="
fi
if [ ${HddPercentageInteger} -ge 100 ] ; then
	HddPercentageBar="===================="
fi

# Show results
if [ "${2}" == "-t" ]; then
	echo ${HddTotal}iB
elif [ "${2}" == "-u" ]; then
	echo ${HddUsed}iB
elif [ "${2}" == "-p" ]; then
	echo ${HddPercentage}
elif [ "${2}" == "-b" ]; then
	echo ${HddPercentageBar}
else
	echo ""
	echo " hddinfo v$VERSION"
	echo " ------------"
	echo ""
	echo " HddTotal = ${HddTotal}iB"
	echo " HddUsed = ${HddUsed}iB"
	echo ""
	echo " HddPercentage Use:"
	echo " ${HddPercentageBar} ${HddPercentage}"
	echo ""
	echo " Available commands:"
	echo ""
	echo " hddinfo.sh ${1} -t | Show HddTotal Size"
	echo " hddinfo.sh ${1} -u | Show HddUsed Size"
	echo " hddinfo.sh ${1} -p | Show HddPercentage Use"
	echo " hddinfo.sh ${1} -b | Show HddPercentage Bar"
	echo ""
	echo " Note: Conky require 'maximum_width = 240'"
	echo ""
fi
