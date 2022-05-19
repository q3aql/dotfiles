#!/bin/bash

# Check updates on Arch Linux
# Note: Create cron on /etc/cron.d/checkupdates with the following lines:
# 0 * * * * root /usr/bin/pacman -Sy
# 30 * * * * root /usr/bin/pacman -Sy
if [ -f /usr/bin/pacman ] ; then
  num_packages=$(pacman -Qu | wc -l)
	echo "${num_packages}"

# Check updates on Ubuntu/Debian/Devuan
# Note: Create cron on /etc/cron.d/checkupdates with the following lines:
# 0 * * * * root /usr/bin/aptitude update
# 30 * * * * root /usr/bin/aptitude update
elif [ -f /usr/bin/aptitude ] ; then
  num_packages=$(aptitude search "~U" | wc -l)
	echo "${num_packages}"

# Disable for other distros
else 
  echo "0"
fi
