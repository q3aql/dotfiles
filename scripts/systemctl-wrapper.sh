#!/bin/bash

##########################################################################
# systemctl-wrapper - Wrapper for sysv init scripts simulating systemctl #
# Autor: Quique Molina                                                   # 
# Contacto: emolina@prosodie.com                                         #
# Licencia: GPL 2.0                                                      #
# ########################################################################
VERSION=1.0

# Variable con scripts de arranque
path_scripts="/etc/init.d"

# Funcion para simular las units y sockets de systemctl
function systemctl_units() {
  list_units=$(ls -1 ${path_scripts})
  echo "UNIT"
  for unit in ${list_units} ; do
    echo "${unit}  --> Script for control boot, stop and status of ${unit} service"
  done
}

# Comprobar si existe el directorio de scripts
function check_dir_scripts() {
  if [ -d "${path_scripts}" ] ; then
    echo > /dev/null
  else
    echo ""
    echo "systemctl (wrapper) v${VERSION} for sysvinit scripts"
    echo ""
    echo "Failed to check ${path_scripts} directory. Not found"
    echo ""
    exit
  fi
}

# Function para mostrar la ayuda
function systemctl_help() {
echo ""
echo "systemctl [OPTIONS...] {COMMAND} ..."
echo ""
echo "-h --help           Show this help"
echo "   --version        Show package version"
echo ""
echo "Unit Commands:"
echo "  list-units                      List loaded units"
echo "  list-sockets                    List loaded sockets ordered by address"
echo "  start NAME...                   Start (activate) one or more units"
echo "  stop NAME...                    Stop (deactivate) one or more units"
echo "  reload NAME...                  Reload one or more units"
echo "  restart NAME...                 Start or restart one or more units"
echo "  status NAME...                  Show runtime status of one or more units"
echo ""
echo "Unit File Commands:"
echo "  list-unit-files                 List installed unit files"
echo "  enable NAME...                  Enable one or more unit files"
echo "  disable NAME...                 Disable one or more unit files"
echo ""
echo "System Commands:"
echo "  halt                            Shut down and halt the system"
echo "  poweroff                        Shut down and power-off the system"
echo "  reboot                          Shut down and reboot the system"
echo ""
}

# Function para mostrar la version
function systemctl_version() {
  echo ""
  echo "systemctl (wrapper) v${VERSION} for sysvinit scripts"
  echo ""
}

# Funcion para el mapeo de comandos
function systemctl_map() {
  # Mapeo del comando start
  if [ "${1}" == "start" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" start
    else
      echo "Failed to start ${2}: Unit not found."
    fi
  # Mapeo del comando enable
  elif [ "${1}" == "enable" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" start
    else
      echo "Failed to enable ${2}: Unit not found."
    fi
  # Mapeo del comando stop
  elif [ "${1}" == "stop" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" stop
    else
      echo "Failed to stop ${2}: Unit not found."
    fi
  # Mapeo del comando disable
  elif [ "${1}" == "disable" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" stop
    else
      echo "Failed to disable ${2}: Unit not found."
    fi
  # Mapeo del comando reload
  elif [ "${1}" == "reload" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" reload
    else
      echo "Failed to reload ${2}: Unit not found."
    fi
  # Mapeo del comando restart
  elif [ "${1}" == "restart" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" restart
    else
      echo "Failed to restart ${2}: Unit not found."
    fi
  # Mapeo del comando status
  elif [ "${1}" == "status" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" status
    else
      echo "Failed to status ${2}: Unit not found."
    fi
  # Mapeo del comando list-units
  elif [ "${1}" == "list-units" ] ; then
    systemctl_units
  # Mapeo del comando list-sockets
  elif [ "${1}" == "list-sockets" ] ; then
    systemctl_units
  # Mapeo del comando list-unit-files
  elif [ "${1}" == "list-unit-files" ] ; then
    systemctl_units
  # Mapeo del comando help
  elif [ "${1}" == "--help" ] ; then
    systemctl_help
  elif [ "${1}" == "-h" ] ; then
    systemctl_help
  # Mapeo del comando version
  elif [ "${1}" == "--version" ] ; then
    systemctl_version
  # Mapeo del comando reboot
  elif [ "${1}" == "reboot" ] ; then
    reboot
  # Mapeo del comando halt
  elif [ "${1}" == "halt" ] ; then
    halt
  # Mapeo del comando poweroff
  elif [ "${1}" == "poweroff" ] ; then
    poweroff
  else
    echo "Unknown operation '${1}'."
  fi
}

# Iniciar el script
check_dir_scripts
if [ -z "${1}" ] ; then
  systemctl_units
else
  systemctl_map "${1}" "${2}"
fi
