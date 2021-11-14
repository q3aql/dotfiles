#!/bin/bash

#################################################
# Script to build and install i3-gaps on Debian #
# Author: q3aql (q3aql@duck.com                 #
# Last update: 14-11-2021                       #
# ###############################################

# Variables
URL_Repo="https://www.github.com/Airblader/i3"
dir_build="i3-gaps"

# Check if you are root
mkdir -p /etc/root &> /dev/null
administrador=$?
if [ ${administrador} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo ""
  echo "* i3-gaps install"
  echo ""
  echo "* Administrator permissions are required"
  echo ""
  exit
fi

# Install dependencies
apt update
apt upgrade -y
apt install dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev -y
apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm-dev -y
apt install cmake make gcc meson ninja-build git -y

#Build and install i3-gaps
cd /tmp
git clone ${URL_Repo} ${dir_build}
cd ${dir_build}
mkdir -p build && cd build
meson ..
ninja
ninja install
cp -rfv /usr/local/bin/i3* /usr/bin/

# Show message to restart
echo ""
echo "* i3-gaps process finished!"
echo ""
echo "* Restart to load i3-gaps"
echo ""

# Clean files
rm -rf /tmp/${dir_build}



