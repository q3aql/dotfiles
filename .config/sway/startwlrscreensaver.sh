#!/bin/bash

# Basic configuration variables
ScreensaverTime="900" # 15 minutes
monitorOne="DP-1" # First monitor
monitorTwo="DP-2" # Second monitor
monitorThree="" # Third monitor

# Load script for load monitors config quickly from resume
LoadConfigResume="${HOME}/.config/sway/startwlrrandr.sh"

# Function for sleep monitors
function sleepMonitors() {
  # Check monitor 3
  if [ -z "${monitorThree}" ] ; then
    echo "Monitor 3 is empty or disabled"
  else
    echo "Sleep monitor 3"
    wlr-randr --output ${monitorThree} --off
  fi
  # Check monitor 2
  if [ -z "${monitorTwo}" ] ; then
    echo "Monitor 2 is empty or disabled"
  else
    echo "Sleep monitor 2"
    wlr-randr --output ${monitorTwo} --off
  fi
  # Check monitor 1
  if [ -z "${monitorOne}" ] ; then
    echo "Monitor 1 is empty or disabled"
  else
    echo "Sleep monitor 1"
    wlr-randr --output ${monitorOne} --off
  fi
}

# Function for resume monitors
function resumeMonitors() {
  # Check monitor 3
  if [ -z "${monitorThree}" ] ; then
    echo "Monitor 3 is empty or disabled"
  else
    echo "Resume monitor 3"
    wlr-randr --output ${monitorThree} --on
  fi
  # Check monitor 2
  if [ -z "${monitorTwo}" ] ; then
    echo "Monitor 2 is empty or disabled"
  else
    echo "Resume monitor 2"
    wlr-randr --output ${monitorTwo} --on
  fi
  # Check monitor 1
  if [ -z "${monitorOne}" ] ; then
    echo "Monitor 1 is empty or disabled"
  else
    echo "Resume monitor 1"
    wlr-randr --output ${monitorOne} --on
  fi
  # Load monitors config quickly
  bash ${LoadConfigResume} screensaver
}

# Boot parameters
if [ -z "${1}" ] ; then
  # Kill previous process
  echo "Trying to kill previous process"
  killall -9 swayidle
  # Init swayidle command
  swayidle timeout ${ScreensaverTime} "bash ${0} sleep" resume "bash ${0} resume"
elif [ "${1}" == "sleep" ] ; then
  sleepMonitors
elif [ "${1}" == "resume" ] ; then
  resumeMonitors
fi

