#!/bin/bash

#################################################
# Script to build and install i3-gaps on Debian #
# Author: q3aql (q3aql@duck.com)                #
# Last update: 09-01-2022                       #
# ###############################################

# Variables
URL_Repo="https://github.com/nwg-piotr/nwg-wrapper.git"
dir_build="nwg-wrapper"

# Check if you are root
mkdir -p /etc/root &> /dev/null
administrador=$?
if [ ${administrador} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo ""
  echo "* nwg-wrapper install"
  echo ""
  echo "* Administrator permissions are required"
  echo ""
  exit
fi

# Install dependencies
echo ""
echo "* INSTALLING DEPENDENCIES..."
echo ""
sleep 2
apt update
apt upgrade -y
apt-get install git python3 python3-pip wlr-randr -y
apt-get install python-setuptools python3-setuptools -y
apt-get install libgtk3.0-cil-dev -y
apt-get install libgtk-layer-shell0 -y
apt-get install libgtk-layer-shell-dev -y
pip3 install gobject
pip3 install i3ipc

# Install nwg-wrapper
cd /tmp
git clone ${URL_Repo}
cd ${dir_build}
python3 setup.py install --optimize=1

