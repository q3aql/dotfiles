#!/bin/bash

############################
# CONNECTION CONFIGURATION #
############################
interface="wlan0"
wireless="yes" # Change to "no" for ethernet
wireless_ssid="tp-link_6789"
wireless_pass="mywirelesspassword"
ip_interface="192.168.0.100/24"
gw_interface="192.168.0.1"
dns_one="1.1.1.1"
dns_two="1.1.0.0"
#############################

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  blue='\e[1;34m'
  red='\e[1;31m'
  yellow='\e[1;33m'
  purple='\e[35m'
  green='\e[32m'
  end='\e[0m'
else
  blue='' # Disable blue color
  red='' # Disable red color
  yellow='' # Disable yellow color
  purple='' # Disable purple color
  green='' # Disable green color
  end='' # Disable color
fi

# CHECK ROOT PERMISSIONS
mkdir -p /etc/root &> /dev/null
administrator=$?
if [ ${administrator} -eq 0 ] ; then
  rm -rf /etc/root
else
  echo -e ""
  echo -e "${blue} # wireless-iwctl${end}"
  echo -e "${purple} ################${end}"
  echo -e ""
  echo -e "${red} # Administrator permissions are required!${end}"
  echo -e ""
  exit
fi

# INITIALIZE CONFIGURATION
echo -e ""
echo -e "${blue} # wireless-iwctl${end}"
echo -e "${purple} ################${end}"
echo -e ""

# CHECK WID PROCESS
check_iwd=$(ps -e | grep " iwd")
if [ -z ${check_iwd} ] ; then
  echo -e "${purple} # Running iwd process${end}"
  systemctl start iwd
  sleep 2
fi

# CONFIGURE WIFI CONNECTTION
if [ "${wireless}" == "yes" ] ; then
  echo -e "${blue} # Connecting ${interface} to SSID ${wireless_ssid}${end}"
  sleep 1
  iwctl --passphrase ${wireless_pass} station ${interface} connect ${wireless_ssid} 2> /dev/null
  connect_error="$?"
  if [ ${connect_error} == 0 ] ; then
    echo -e "${green} # Connected to ${wireless_ssid}${end}"
  else
    echo -e "${red} # Failed to connect ${wireless_ssid}${end}"
  fi
fi

# CONFIGURE IP ADDRESS
echo -e "${purple} # Configuring IP address for ${interface}${end}"
sleep 1
ip addr add ${ip_interface} dev ${interface} 2> /dev/null
connect_error="$?"
if [ ${connect_error} == 0 ] ; then
  echo -e "${green} # Configured IP ${ip_interface} for ${interface}${end}"
else
  echo -e "${red} # Failed to configure IP ${ip_interface} for ${interface}${end}"
fi
echo -e "${purple} # Configuring gateway for ${interface}${end}"
sleep 1
ip route add default via ${gw_interface} 2> /dev/null
connect_error="$?"
if [ ${connect_error} == 0 ] ; then
  echo -e "${green} # Configured gateway ${gw_interface} for ${interface}${end}"
else
  echo -e "${red} # Failed to configure gateway ${gw_interface} for ${interface}${end}"
fi
echo -e "${purple} # Setting UP interface ${interface}${end}"
sleep 1
ip link set ${interface} up 2> /dev/null
connect_error="$?"
if [ ${connect_error} == 0 ] ; then
  echo -e "${green} # The interface ${interface} is now UP${end}"
else
  echo -e "${red} # The interface ${interface} is now DOWN${end}"
fi

# CONFIGURAR LOS DNS
echo -e "${yellow} # Configuring DNS servers${end}"
echo "nameserver ${dns_one}" > /etc/resolv.conf 2> /dev/null
error_dns="$?"
echo "nameserver ${dns_two}" >> /etc/resolv.conf 2> /dev/null
error_dns_sec="$?"
connect_error=$(expr ${error_dns} + ${error_dns_sec})
if [ ${connect_error} == 0 ] ; then
  echo -e "${green} # Configured primary DNS ${dns_one}${end}"
  echo -e "${green} # Configured secondary DNS ${dns_two}${end}"
else
  echo -e "${red} # Failed to configure DNS servers${end}"
fi

