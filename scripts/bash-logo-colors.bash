#!/bin/bash

# Variables para mostrar
#os_system="Devuan 4"
os_system=$(lsb_release -d | tr -s " " | cut -d ":" -f 2)
os_system=$(echo ${os_system})
kernel=$(uname -r)
uptime=$(uptime | tr -s " " | cut -d "," -f 1)
uptime=$(echo ${uptime})
#shell="5.1.4" # Run bash --version
shell=$(bash --version | head -1 | tr -s " " | cut -d " " -f 4 | cut -d "(" -f 1 | cut -d "-" -f 1)
resolution=$(xrandr 2> /dev/null | grep "*" | head -1  | tr -s " " | cut -d " " -f 2)
user_loaded=$(whoami)
home_user="${HOME}"
cpu_model=$(lscpu | grep "Model name:" | tr -s " " | cut -d ":" -f 2)
cpu_model=$(echo ${cpu_model})
mem_total=$(lsmem | grep "Total online memory:" | tr -s " " | cut -d ":" -f 2)
mem_total=$(echo ${mem_total})
arch_system="${HOSTTYPE}"
hostname="${HOSTNAME}"
session_type="${XDG_SESSION_TYPE}"

echo -e "                                       "
echo -e "\e[31m         :.         .:      \e[0m"      
echo -e "\e[31m      .=:             :=.   \e[0m"   
echo -e "\e[31m     -+                 =-  \e[0m   \e[33mOS: \e[0m\e[35m${os_system}\e[0m"  
echo -e "\e[31m    :#                   *- \e[0m   \e[33mHost: \e[0m\e[35m${hostname}\e[0m" 
echo -e "\e[31m    @=                   :@ \e[0m   \e[33mKernel: \e[0m\e[35m${kernel}\e[0m"
echo -e "\e[31m   .@-                   :@:\e[0m   \e[33mUptime: \e[0m\e[35m${uptime}\e[0m"
echo -e "\e[31m    @*                   *@.\e[0m   \e[33mShell: \e[0m\e[35mbash ${shell}\e[0m"
echo -e "\e[31m    #@*      :=++:      =@# \e[0m   \e[33mResolution: \e[0m\e[35m${resolution}\e[0m"
echo -e "\e[31m     #@#:     *@#     .#@%  \e[0m   \e[33mUser: \e[0m\e[35m${user_loaded}\e[0m"
echo -e "\e[31m      =%@%=:  *@*  :=%@@+   \e[0m   \e[33mHome: \e[0m\e[35m${home_user}\e[0m"
echo -e "\e[31m        -#@@@@@@@@@@@%+     \e[0m   \e[33mSession: \e[0m\e[35m${session_type}\e[0m"
echo -e "\e[31m           .=+%@@+=-.       \e[0m   \e[33mArch: \e[0m\e[35m${arch_system}\e[0m"
echo -e "\e[31m              *@#           \e[0m   \e[33mCPU: \e[0m\e[35m${cpu_model}\e[0m"
echo -e "\e[31m              +@*           \e[0m   \e[33mMemory: \e[0m\e[35m${mem_total}\e[0m"
echo -e "\e[31m              :@:           \e[0m"
echo -e "\e[31m               %            \e[0m"
echo -e "\e[31m                            \e[0m"
echo -e "\e[32m # Bienvenido al terminal de ${user_loaded}\e[0m"
echo -e -n "\e[35m # Cargando el terminal / \e[0m"
echo ""
