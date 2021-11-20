#!/bin/bash

###############################################################
# down-daemon (down-screen) - Daemon to shutdown the screen   #
# Date: 19-11-2020                                            #
# Author: q3aql                                               #
# Contact: q3aql@duck.com                                     #
###############################################################
VERSION="1.0"
M_DATE="191120"

# Variable
endProcess=0

# Run screensaver
sleep 3
echo "* Forcing screen to shutdown..."
xset dpms force off

