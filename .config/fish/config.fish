# Set term color
set TERM xterm-256color

# some aliases
alias grep='grep --color=auto'
if test -f /usr/bin/batcat
  alias cat='batcat --style=plain --paging=never'
else if test -f /usr/bin/bat
  alias cat='bat --style=plain --paging=never'
end
if test -f /usr/bin/exa
  alias ls='exa --group-directories-first'
  alias tree='exa -T'
else
  alias ls="ls --color=auto"
end
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Load terminal
echo ""
echo -e -n "\e[32m# Preparing to start \e[0m\e[35mfish\e[0m \e[32mshell...\e[0m"
if test -f /usr/bin/lsb_release
  set os_system (lsb_release -d 2> /dev/null | tr -s " " | cut -d ":" -f 2)
  set os_system (echo {$os_system} | cut -f 2)
else
  set os_system (uname -o)
end
set kernel (uname -r)
if test -f /usr/bin/uptime
  set uptime (uptime | tr -s " " | cut -d "," -f 1)
  set uptime (echo {$uptime} | cut -f 2)
else
  set uptime "Unknown"
end
#set shell="3.1.2" # Run fish --version
set shell (fish --version | cut -d " " -f 3)
if test -f /usr/bin/xrandr
  set resolution (xrandr 2> /dev/null | grep "*" | head -1  | tr -s " " | cut -d " " -f 2)
  if test -z "$resolution"
    set resolution "No display"
  end
else
  set resolution "No display"
end
set user_loaded (whoami)
set home_user {$HOME}
if test -f /proc/cpuinfo
  set cpu_model (cat /proc/cpuinfo | grep -i "model name" | head -1 | tr -s " " | cut -d ":" -f 2)
  set cpu_model (echo $cpu_model)
else if test -f /usr/bin/lscpu
  set cpu_model (lscpu | grep -i "Model name:" | tr -s " " | cut -d ":" -f 2)
  set cpu_model (echo {$cpu_model} | tr -s " ")
else
  set cpu_model "Unknown"
end
if test -f /proc/meminfo
  set mem_total_kb (cat /proc/meminfo | grep -i "memtotal" | tr -s " " | cut -d ":" -f 2)
  set mem_total_kb_num (echo $mem_total_kb | tr -s " " | cut -d " " -f 2)
  set mem_total_gb (expr $mem_total_kb_num / 1000 / 1000)
  set mem_total (echo {$mem_total_gb}G)
else if test -f /usr/bin/lsmem
  set mem_total (lsmem | grep -i "Total online memory:" | tr -s " " | cut -d ":" -f 2)
  set mem_total (echo {$mem_total} | cut -f 2)
else
  set mem_total "Unknown"
end
set arch_system (uname -m)
set hostname_host $hostname
if test -z "$XDG_SESSION_TYPE"
  set session_type "tty"
else
  set session_type {$XDG_SESSION_TYPE}
end

#echo ""
#echo ""
#screenfetch -p
#neofetch --color_blocks off
#echo ""

clear
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

function fish_prompt
  # interactive user name @ host name, date/time in YYYY-mm-dd format and path
  set current_dir (pwd)
  set current_date (date '+%Y-%m-%d %H:%M:%S')
  echo -e ""
  echo -e -n " "
  echo -e -n "\e[36m$current_date\e[0m "
  echo -e -n "\e[31m○\e[0m"
  echo -e -n "  "
  echo -e -n "\e[35m$user_loaded@$hostname\e[0m in \e[32m$current_dir\e[0m"
  echo -e ""  
  echo -e "\e[36m○\e[0m \e[32m→\e[0m "
end
