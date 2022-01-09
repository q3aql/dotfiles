#!/bin/bash

#################################################
# Script to build and install i3-gaps on Debian #
# Author: q3aql (q3aql@duck.com)                #
# Last update: 09-01-2022                       #
# ###############################################

# Variables
URL_Repo="https://www.github.com/Airblader/i3"
URL_Package_Stable="https://github.com/Airblader/i3/releases/download/4.20.1/i3-4.20.1.tar.xz"
URL_Package_Stable_DEB="https://github.com/barnumbirr/i3-gaps-debian/releases/download/v4.20.1-1/i3-gaps_4.20.1-1_amd64_bullseye.deb"
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

# Install i3-gaps from Git
function i3_gaps_install_git() {
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
}

# Install i3-gaps Stable
function i3_gaps_install_stable() {
  #Build and install i3-gaps
  cd /tmp
  wget -c ${URL_Package_Stable}
  tar Jxvf i3-4.20.1.tar.xz
  cd i3-4.20.1
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
}

# Install i3-gaps Stable from DEB
function i3_gaps_install_stable_deb() {
  cd /tmp
  wget -c ${URL_Package_Stable_DEB}
  apt remove i3 i3-wm -y
  apt install gdebi -y
  gdebi -n i3-gaps_4.20.1-1_amd64_bullseye.deb
}

# Install dependencies
echo ""
echo "* INSTALLING DEPENDENCIES..."
echo ""
sleep 2
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

# show menu
clear
echo ""
echo "* Installer for i3-gaps on Debian/Devuan"
echo ""
echo " s - Install i3-gaps stable"
echo " g - Install i3-gaps git"
echo " d - Install i3-gaps stable with deb package"
echo ""
echo -n "* [Default: d] Choose an option: " ; read option
if [ "${option}" == "s" ] ; then
  i3_gaps_install_stable
elif [ "${option}" == "g" ] ; then
  i3_gaps_install_git
elif [ "${option}" == "d" ] ; then
  i3_gaps_install_stable_deb
else
  i3_gaps_install_stable_deb
fi







