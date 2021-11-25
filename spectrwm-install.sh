#!/bin/bash

######################################################################
# Script to build and install last version spectrwm on Ubuntu/Debian #
# Author: q3aql (q3aql@duck.com)                                     #
# Last update: 24-11-2021                                            #
# ####################################################################

# Variables
URL_Repo="https://github.com/conformal/spectrwm"
dir_build="spectrwm"

# Check if you are root
mkdir -p /etc/root &> /dev/null
administrador=$?
if [ ${administrador} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo ""
  echo "* spectrwm install"
  echo ""
  echo "* Administrator permissions are required"
  echo ""
  exit
fi

# Install dependencies
apt update
apt upgrade -y
sudo apt install autopoint debhelper dh-autoreconf dh-strip-nondeterminism dwz gettext \
gettext-base intltool-debian libarchive-zip-perl libdebhelper-perl make cmake gcc \
libfile-stripnondeterminism-perl libice-dev libsm-dev libsub-override-perl libtool \
libx11-dev libx11-xcb-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev \
libxcb-util-dev libxcb-util0-dev libxcb-xinput-dev libxcb-xtest0-dev libxcursor-dev \
libxext-dev libxfixes-dev libxft-dev libxi-dev libxrandr-dev libxrender-dev libxt-dev \
libxtst-dev po-debconf x11proto-input-dev x11proto-randr-dev x11proto-record-dev \
x11proto-xext-dev xtrans-dev git spectrwm -y

# Build and install spectrwm
cd /tmp/
git clone ${URL_Repo} ${dir_build}
cd ${dir_build}/linux
make
make install
cp -rfv /usr/local/bin/spectrwm /usr/bin/
chmod +x /usr/bin/spectrwm

# Show message to restart
echo ""
echo "* spectrwm process finished!"
echo ""
