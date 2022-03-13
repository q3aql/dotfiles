#!/bin/bash

##########################################################################
# systemctl-wrapper - Wrapper for sysv init scripts simulating systemctl #
# Author: q3aql                                                          # 
# Contact: q3aql@duck.com                                                #
# License: GPL 2.0                                                       #
# ########################################################################
VERSION=1.0

# Variable with start-up scripts
path_scripts="/etc/init.d"

# Function to simulate the units and sockets of systemctl
function systemctl_units() {
  list_units=$(ls -1 ${path_scripts})
  echo "UNIT"
  for unit in ${list_units} ; do
    echo "${unit}  --> Script for control boot, stop and status of ${unit} service"
  done
}

# Check if the scripts directory exists
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

# Function to display help
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

# Function to display the version
function systemctl_version() {
  echo ""
  echo "systemctl (wrapper) v${VERSION} for sysvinit scripts"
  echo ""
}

# Function for command mapping
function systemctl_map() {
  # Mapping of the start command
  if [ "${1}" == "start" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" start
    else
      echo "Failed to start ${2}: Unit not found."
    fi
  # Mapping of the enable command
  elif [ "${1}" == "enable" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" start
    else
      echo "Failed to enable ${2}: Unit not found."
    fi
  # Mapping of the stop command
  elif [ "${1}" == "stop" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" stop
    else
      echo "Failed to stop ${2}: Unit not found."
    fi
  # Mapping of the disable command
  elif [ "${1}" == "disable" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" stop
    else
      echo "Failed to disable ${2}: Unit not found."
    fi
  # Mapping of the reload command
  elif [ "${1}" == "reload" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" reload
    else
      echo "Failed to reload ${2}: Unit not found."
    fi
  # Mapping of the restart command
  elif [ "${1}" == "restart" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" restart
    else
      echo "Failed to restart ${2}: Unit not found."
    fi
  # Mapping of the status command
  elif [ "${1}" == "status" ] ; then
    if [ -f "${path_scripts}/${2}" ] ; then
      "${path_scripts}/${2}" status
    else
      echo "Failed to status ${2}: Unit not found."
    fi
  # Mapping of the list-units command
  elif [ "${1}" == "list-units" ] ; then
    systemctl_units
  # Mapping of the list-sockets command
  elif [ "${1}" == "list-sockets" ] ; then
    netstat -putan | grep LISTEN
  # Mapping of the list-unit-files command
  elif [ "${1}" == "list-unit-files" ] ; then
    systemctl_units
  # Mapping of the help command
  elif [ "${1}" == "--help" ] ; then
    systemctl_help
  elif [ "${1}" == "-h" ] ; then
    systemctl_help
  # Mapping of the version command
  elif [ "${1}" == "--version" ] ; then
    systemctl_version
  # Mapping of the reboot command
  elif [ "${1}" == "reboot" ] ; then
    reboot
  # Mapping of the halt command
  elif [ "${1}" == "halt" ] ; then
    halt
  # Mapping of the poweroff command
  elif [ "${1}" == "poweroff" ] ; then
    poweroff
  else
    echo "Unknown operation '${1}'."
  fi
}

# Start the script
check_dir_scripts
if [ -z "${1}" ] ; then
  systemctl_units
else
  systemctl_map "${1}" "${2}"
fi
