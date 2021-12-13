#!/bin/bash

# Basic configuration variables
ScreensaverProgram="xautolock" # Options: xautolock or xscreensaver
ScreensaverTime="20" # 20 minutes (only for xautolock)

# Init screensaver
sleep 5
if [ "${ScreensaverProgram}" == "xautolock" ] ; then
  echo "Using 'xautolock' as screensaver program"
  xautolock -time ${ScreensaverTime} -locker "xset dpms force off"
elif [ "${ScreensaverProgram}" == "xscreensaver" ] ; then
  echo "Using 'xscreensaver' as screensaver program"
  xscreensaver &
else
  echo "Using 'xautolock' as screensaver program"
  xautolock -time ${ScreensaverTime} -locker "xset dpms force off"
fi

