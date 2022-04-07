# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

TERM=xterm-256color

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  PS1="\n\[\033[01;36m\] \D{%Y-%m-%d} \t\[\033[00m\] \[\033[00;31m\]○\[\033[00m\]  \[\033[00;35m\]\u@\h\[\033[00m\] in \[\033[00;32m\]\w\n\[\033[00m\]\[\033[00;36m\]○\[\033[00m\] \[\033[00;32m\]→\[\033[00m\] "
else
  PS1="\n \D{%Y-%m-%d} \t ○  \u@\h in \w\n○ → "
  #PS1="\n \D{%Y-%m-%d} \t o  \u@\h in \w\no -> "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\n\[\033[01;36m\] \D{%Y-%m-%d} \t\[\033[00m\] \[\033[00;31m\]○\[\033[00m\]  \[\033[00;35m\]\u@\h\[\033[00m\] in \[\033[00;32m\]\w\n\[\033[00m\]\[\033[00;36m\]○\[\033[00m\] \[\033[00;32m\]→\[\033[00m\] "
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH=${PATH}:/opt/qt515/bin
#echo ""
#echo ""
#neofetch --color_blocks off
#echo ""

[ -f ${HOME}/.fzf.bash ] && source ${HOME}/.fzf.bash

if [ -f $HOME/.cargo/env ] ; then
  . "$HOME/.cargo/env"
fi

if [ -f ~/.bash_completion/alacritty ] ; then
  source ~/.bash_completion/alacritty
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# some more ls aliases
alias grep='grep --color=auto'
alias cat='batcat --style=plain --paging=never'
alias ls='exa --group-directories-first'
alias tree='exa -T'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

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

clear
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
echo -e "\e[32m # Welcome to terminal of ${user_loaded}\e[0m"
echo -e -n "\e[35m # Loading terminal / \e[0m"
echo "" 

