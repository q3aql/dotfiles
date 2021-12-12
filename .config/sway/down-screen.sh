#!/bin/bash

######################################################
# down-screen - Script for sleep and resume monitors #
# Date: 12-12-2021                                   #
# Author: q3aql                                      #
# Contact: q3aql@duck.com                            #
######################################################

# Load script for sleep and resume monitors
LoadScriptScreensaver="${HOME}/.config/sway/startwlrscreensaver.sh"

# Create or read init file
stateFile="${HOME}/.config/sway/screen-state"
if [ -f ${stateFile} ] ; then
  echo "Screen State file detected"
else
  echo "resume" > ${stateFile}
fi

# Boot parameters
current_state=$(cat ${stateFile})
if [ "${current_state}" == "resume" ] ; then
  bash "${LoadScriptScreensaver}" sleep
  echo "sleep" > ${stateFile}
elif [ "${current_state}" == "sleep" ] ; then
  bash "${LoadScriptScreensaver}" resume
  echo "resume" > ${stateFile}
fi
