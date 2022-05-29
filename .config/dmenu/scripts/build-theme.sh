#!/bin/bash

main_folder="/opt/dmenu-scripts/"
folder_themes="/opt/dmenu-scripts/themes"

if [ -z "${1}" ] ; then
  echo "# Theme selector canceled"
else
  if [ -f "${folder_themes}/${1}" ] ; then
    cp -rf ${folder_themes}/${1} ${main_folder}/config.h
    cp -rf ${folder_themes}/${1} ${main_folder}/config.def.h
    cd ${main_folder}
    make install clean
  else
    echo "# Theme selector canceled"
  fi
fi
