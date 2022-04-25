#!/bin/bash

# Check updates on Arch Linux
# Note: Create cron on /etc/cron.d/checkupdates with the following lines:
# 0 * * * * root /usr/bin/pacman -Sy
# 30 * * * * root /usr/bin/pacman -Sy
if [ -f /usr/bin/pacman ] ; then
  pacman -Qu

# Check updates on Ubuntu/Debian/Devuan
# Note: Create cron on /etc/cron.d/checkupdates with the following lines:
# 0 * * * * root /usr/bin/aptitude update
# 30 * * * * root /usr/bin/aptitude update
elif [ -f /usr/bin/aptitude ] ; then
  aptitude search "~U"
fi
