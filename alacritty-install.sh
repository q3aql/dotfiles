#!/bin/bash

###################################################
# Script to build and install alacritty on Debian #
# Author: q3aql (q3aql@duck.com                   #
# Last update: 14-11-2021                         #
# ################################################

# Variables
URL_Repo="https://github.com/alacritty/alacritty"
dir_build="alacritty"

# Check if you are root
mkdir -p /etc/root &> /dev/null
administrador=$?
if [ ${administrador} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo ""
  echo "* alacritty install"
  echo ""
  echo "* Administrator permissions are required"
  echo ""
  exit
fi

# Install dependencies
apt update
apt upgrade -y
apt install make gcc autoconf cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 cargo git -y

#Build and install i3-gaps
cd /tmp
git clone ${URL_Repo} ${dir_build}
cd ${dir_build}
cargo build --release
cd target/release/
strip --strip-all alacritty
cp -rfv alacritty /usr/bin/
chmod +x /usr/bin/alacritty

# Show message to restart
echo ""
echo "* alacritty process finished!"
echo ""
echo "* Exec 'alacritty' for load app"
echo ""

# Clean files
rm -rf /tmp/${dir_build}



