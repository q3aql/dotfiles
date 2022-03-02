#!/usr/bin/fish

set TERM xterm-256color

set user_loaded (whoami)
set hostname_host (hostname)

function fish_prompt
  # interactive user name @ host name, date/time in YYYY-mm-dd format and path
  set current_dir (pwd)
  set current_date (date '+%Y-%m-%d %H:%M:%S')
  echo -e ""
  echo -e -n " "
  echo -e -n "\e[36m$current_date\e[0m "
  echo -e -n "\e[31m○\e[0m"
  echo -e -n "  "
  echo -e -n "\e[35m$user_loaded@$hostname_host\e[0m in \e[32m$current_dir\e[0m"
  echo -e ""  
  echo -e "\e[36m○\e[0m \e[32m→\e[0m "
end
