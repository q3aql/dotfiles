#!/usr/bin/fish

set TERM xterm-256color

set user_loaded (whoami)
set hostname_host (hostname)

function fish_prompt
  # interactive user name @ host name, date/time in YYYY-mm-dd format and path
  set current_dir (pwd)
  set current_time (date '+%H:%M:%S')
  echo -e ""
  echo -e -n "\e[34m$user_loaded@$hostname_host\e[0m "
  echo -e -n "[\e[33m$current_dir\e[0m] "
  echo -e -n "\e[32m○\e[0m "
  echo -e -n "\e[35m[\e[0m$current_time\e[35m]\e[0m"
  echo -e ""  
  echo -e "> "
end
