#!/bin/bash

# Check if you are root
mkdir -p /etc/root &> /dev/null
administrador=$?
if [ ${administrador} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo ""
  echo "* Administrator permissions are required"
  echo ""
  exit
fi

# Install fonts
mkdir -p /usr/share/fonts/truetype/mononoki/
mkdir -p /usr/share/fonts/truetype/joypixels/
tar Jxvf joypixels-fonts.tar.xz -C /usr/share/fonts/truetype/joypixels/
tar Jxvf mononoki-nerds-fonts.tar.xz -C /usr/share/fonts/truetype/mononoki/
