#!/bin/bash

# Script to show cpu
# Created by q3aql (q3aql@protonmail.ch)
# Licensed by GPL v.2
# Date: 10-01-2020
# --------------------------------------
VERSION="1.0"


# Variables
cpuPercentage=$(top -b -n1 | grep \%Cpu | awk '{print 100-$8}')
showCpuPercentage=$(echo ${cpuPercentage})
showCpuPercentageInteger=$(echo ${showCpuPercentage} | cut -d "." -f 1)

# Show percentage bar
if [ ${showCpuPercentageInteger} -ge 0 ] ; then
	showCpuPercentageBar="="
fi
if [ ${showCpuPercentageInteger} -ge 3 ] ; then
	showCpuPercentageBar="=="
fi
if [ ${showCpuPercentageInteger} -ge 12 ] ; then
	showCpuPercentageBar="==="
fi
if [ ${showCpuPercentageInteger} -ge 18 ] ; then
	showCpuPercentageBar="===="
fi
if [ ${showCpuPercentageInteger} -ge 25 ] ; then
	showCpuPercentageBar="====="
fi
if [ ${showCpuPercentageInteger} -ge 35 ] ; then
	showCpuPercentageBar="======"
fi
if [ ${showCpuPercentageInteger} -ge 40 ] ; then
	showCpuPercentageBar="======="
fi
if [ ${showCpuPercentageInteger} -ge 45 ] ; then
	showCpuPercentageBar="========"
fi
if [ ${showCpuPercentageInteger} -ge 50 ] ; then
	showCpuPercentageBar="=========="
fi
if [ ${showCpuPercentageInteger} -ge 62 ] ; then
	showCpuPercentageBar="============="
fi
if [ ${showCpuPercentageInteger} -ge 75 ] ; then
	showCpuPercentageBar="==============="
fi
if [ ${showCpuPercentageInteger} -ge 85 ] ; then
	showCpuPercentageBar="================="
fi
if [ ${showCpuPercentageInteger} -ge 90 ] ; then
	showCpuPercentageBar="=================="
fi
if [ ${showCpuPercentageInteger} -ge 95 ] ; then
	showCpuPercentageBar="==================="
fi
if [ ${showCpuPercentageInteger} -ge 100 ] ; then
	showCpuPercentageBar="===================="
fi

# Show results
if [ "$1" == "-p" ]; then
	echo ${showCpuPercentage}%
elif [ "$1" == "-b" ]; then
	echo ${showCpuPercentageBar}
else
	echo ""
	echo " cpuinfo v$VERSION"
	echo " ------------"
	echo ""
	echo " CpuPercentage Use:"
	echo " ${showCpuPercentageBar} ${showCpuPercentage}%"
	echo ""
	echo " Available commands:"
	echo ""
	echo " cpuinfo.sh -p | Show CpuPercentage"
	echo " cpuinfo.sh -b | Show CpuPercentage Bar"
	echo ""
	echo " Note: Conky require 'maximum_width = 240'"
	echo ""
fi
