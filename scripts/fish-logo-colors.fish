#!/usr/bin/fish

set TERM xterm-256color

set os_system (lsb_release -d | tr -s " " | cut -d ":" -f 2)
set os_system (echo {$os_system} | cut -f 2)
set kernel (uname -r)
set uptime (uptime | tr -s " " | cut -d "," -f 1)
set uptime (echo {$uptime} | cut -f 2)
#set shell="3.1.2" # Run fish --version
set shell (fish --version | cut -d " " -f 3)
set resolution (xrandr 2> /dev/null | grep "*" | head -1  | tr -s " " | cut -d " " -f 2)
set user_loaded (whoami)
set home_user {$HOME}
set cpu_model (lscpu | grep "Model name:" | tr -s " " | cut -d ":" -f 2)
set cpu_model (echo {$cpu_model} | tr -s " ")
set mem_total (lsmem | grep "Total online memory:" | tr -s " " | cut -d ":" -f 2)
set mem_total (echo {$mem_total} | cut -f 2)
set arch_system (uname -m)
set hostname_host (hostname)
set session_type {$XDG_SESSION_TYPE}

echo -e "                                       "
echo -e "\e[31m         :.         .:      \e[0m"
echo -e "\e[31m      .=:             :=.   \e[0m"
echo -e "\e[31m     -+                 =-  \e[0m   \e[33mOS: \e[0m\e[35m$os_system\e[0m"
echo -e "\e[31m    :#                   *- \e[0m   \e[33mHost: \e[0m\e[35m$hostname_host\e[0m"
echo -e "\e[31m    @=                   :@ \e[0m   \e[33mKernel: \e[0m\e[35m$kernel\e[0m"
echo -e "\e[31m   .@-                   :@:\e[0m   \e[33mUptime: \e[0m\e[35m$uptime\e[0m"
echo -e "\e[31m    @*                   *@.\e[0m   \e[33mShell: \e[0m\e[35mfish $shell\e[0m"
echo -e "\e[31m    #@*      :=++:      =@# \e[0m   \e[33mResolution: \e[0m\e[35m$resolution\e[0m"
echo -e "\e[31m     #@#:     *@#     .#@%  \e[0m   \e[33mUser: \e[0m\e[35m$user_loaded\e[0m"
echo -e "\e[31m      =%@%=:  *@*  :=%@@+   \e[0m   \e[33mHome: \e[0m\e[35m$home_user\e[0m"
echo -e "\e[31m        -#@@@@@@@@@@@%+     \e[0m   \e[33mSession: \e[0m\e[35m$session_type\e[0m"
echo -e "\e[31m           .=+%@@+=-.       \e[0m   \e[33mArch: \e[0m\e[35m$arch_system\e[0m"
echo -e "\e[31m              *@#           \e[0m   \e[33mCPU: \e[0m\e[35m$cpu_model\e[0m"
echo -e "\e[31m              +@*           \e[0m   \e[33mMemory: \e[0m\e[35m$mem_total\e[0m"
echo -e "\e[31m              :@:           \e[0m"
echo -e "\e[31m               %            \e[0m"
echo -e "\e[31m                            \e[0m"
echo -e "\e[32m # Welcome to terminal of $user_loaded\e[0m"
echo -e -n "\e[35m # Loading terminal / \e[0m"
echo ""
echo ""
