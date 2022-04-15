# Zshrc configuration file

# locales
export LC_ALL=""
export LC_COLLATE=C
#export LANG=es_ES.UTF-8

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Options
setopt \
NO_all_export \
   always_last_prompt \
NO_always_to_end \
   append_history \
   auto_cd \
   auto_list \
   auto_menu \
NO_auto_name_dirs \
   auto_param_keys \
   auto_param_slash \
   auto_pushd \
   auto_remove_slash \
NO_auto_resume \
   bad_pattern \
   bang_hist \
NO_beep \
   brace_ccl \
   correct_all \
NO_bsd_echo \
   cdable_vars \
NO_chase_links \
NO_clobber \
   complete_aliases \
   complete_in_word \
   correct \
   correct_all \
   csh_junkie_history \
NO_csh_junkie_loops \
NO_csh_junkie_quotes \
NO_csh_null_glob \
NO_dvorak \
   equals \
   extended_glob \
   extended_history \
   function_argzero \
   glob \
NO_glob_assign \
   glob_complete \
   glob_dots \
   glob_subst \
   hash_cmds \
   hash_dirs \
   hash_list_all \
   hist_allow_clobber \
   hist_beep \
   hist_ignore_dups \
   hist_ignore_space \
NO_hist_no_store \
NO_hist_save_no_dups \
   hist_verify \
NO_hup \
NO_ignore_braces \
NO_ignore_eof \
   interactive_comments \
NO_list_ambiguous \
NO_list_beep \
   list_types \
   long_list_jobs \
   magic_equal_subst \
NO_mail_warning \
NO_mark_dirs \
   menu_complete \
   multios \
NO_nomatch \
   notify \
NO_null_glob \
   numeric_glob_sort \
NO_overstrike \
   path_dirs \
   posix_builtins \
NO_print_exit_value \
NO_prompt_cr \
   prompt_subst \
   pushd_ignore_dups \
NO_pushd_minus \
NO_pushd_silent \
   pushd_to_home \
   rc_expand_param \
NO_rc_quotes \
NO_rm_star_silent \
NO_sh_file_expansion \
   sh_option_letters \
   short_loops \
NO_sh_word_split \
NO_single_line_zle \
NO_sun_keyboard_hack \
   unset \
NO_verbose \
NO_xtrace \
   zle

# Completions
autoload -U compinit ; compinit
zmodload -i zsh/complist
autoload -U colors
colors
zstyle :compinstall filename '~/.zshrc'
# Compliations for make ...
compile=(install clean remove uninstall deinstall)
compctl -k compile make
# cd & co.: only in directories
compctl -g '*(-/)' + -g '.*(/)' cd chdir dirs pushd rmdir dircmp cl
# tar & co.: only directories and archives
compctl -g '*.(gz|z|Z|t[agp]z|tarZ|tz)' + -g '*(-/)' gunzip gzcat zcat
# Sound: Sounds + Playlists + directories 
compctl -g '*.(mp3|MP3|ogg|OGG|temp|TEMP|m3u|pls)' + -g '*(-/)'  mpg123 xmms EP
# Browser: only HTML and dirs
compctl -g "*.html *.htm" + -g "*(-/) .*(-/)" + -H 0 '' w3m lynx elinks wget opera EL O
# xpdf: only PDFs and dirs
compctl -g '*.(pdf|PDF)' + -g '*(-/)'  xpdf pdf2ps
# pictures: only pics and dirs
compctl -g '*.(jpg|JPG|jpeg|JPEG|gif|GIF|png|PNG|bmp)' + -g '*(-/)' gimp xv display gqview
# xdvi: DVIs and dirs
compctl -g '*.dvi' + -g '*(-/)' dvips xdvi gxdvi
# lp und gv: PS-Files and dirs
compctl -g '*.ps' + -g '*(-/)' lp gv

zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:correct:*' insert-unambiguous true # RTFM :P

zstyle ':completion:*' completer _complete _correct _approximate
# Globbing
zstyle ':completion:*' glob true

zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
zstyle ':completion:*' group-name ''
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' menu select=2

zstyle ':completion:*:ssh:*' group-order 'users' 'hosts'
zstyle ':completion:*:*:rm:*' file-patterns '(*~|\\#*\\#):backup-files' '*.zwc:zsh\ bytecompiled\ files' 'core(|.*):core\ files' '*:all-files'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:less:*' menu yes select
zstyle ':completion:*:*:mutt:*' menu yes select

# bindkey
bindkey -e
bindkey "\e[3~" delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey -M menuselect 'h' vi-backward-char                
bindkey -M menuselect 'j' vi-down-line-or-history        
bindkey -M menuselect 'k' vi-up-line-or-history         
bindkey -M menuselect 'l' vi-forward-char              
bindkey -M menuselect 'i' accept-and-menu-complete
bindkey -M menuselect 'o' accept-and-infer-next-history

# env vars
export COLORTERM=yes
export EDITOR=/usr/bin/vim
export PAGER=less
export LESS=aCeiM
export BROWSER=elinks
export PATH=$PATH:/opt/bin:$HOME/bin

# Functions
function google () { $BROWSER "[url]http://www.google.com/search?q=$*[/url]"; }

# colors for ls
if [[ -f ~/.dir_colors ]] ; then
    eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

# Prompt
if [[ `whoami` == "root" ]]; then are_im_root="$fg[red]"; else; are_im_root="$fg[blue]"; fi
#if [[ "${DISPLAY#$HOST}" != ":0.0" &&  "${DISPLAY}" != ":0.0" ]]; then hostcolor="red"; else; hostcolor="green"; fi
if [[ "${${DISPLAY}#*:}" != "0.0" ]]; then hostcolor="yellow"; else; hostcolor="green"; fi

#export PS1="$fg[black]______________________________________________
#$fg[red]<<<$fg[white] %D{%d. %B %Y (%a)}  -  %D{%k:%M:%S}  -  $fg_bold[blue]%~ $fg[red] >>>
#$fg_bold[$hostcolor]%n@%m $are_im_root $terminfo[sgr0]"
export PS1="$fg[black]______________________________________________
$fg[red]<<<$fg[white] %D{%d. %B %Y (%a)}  -  %D{%k:%M:%S} $fg[red] >>> 
$fg_bold[$hostcolor]%n@%m  -  $fg_bold[blue]%~ $are_im_root%# $terminfo[sgr0] 
> "
export PS2="> "
#export RPS1="foo"

# source them
[ -f ~/.alias/alias-general ] && source ~/.alias/alias-general
[ -f ~/.alias/alias-home ] && source ~/.alias/alias-home
[ -f ~/.alias/alias-autoliv ] && source ~/.alias/alias-autoliv
[ -f ~/.alias/alias-fs20 ] && source ~/.alias/alias-fs20

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Detect prompt color
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1="
 %F{cyan}20%D %* %F{red}○  %F{magenta}%n@%m %F{default}in %F{green}%/%f
%F{cyan}○ %F{green}→ %F{default}"
else
  PS1="
 20%D %* ○  %n@%m in %/%f
○ → "
  #PS1="
 #20%D %* o  %n@%m in %/%f
#o -> "
fi

# some more ls aliases
alias grep='grep --color=auto'
if [ -f /usr/bin/batcat ] ; then
  alias cat='batcat --style=plain --paging=never'
elif [ -f /usr/bin/bat ] ; then
  alias cat='bat --style=plain --paging=never'
fi
if [ -f /usr/bin/exa ] ; then
  alias ls='exa --group-directories-first'
  alias tree='exa -T'
else
  alias ls="ls --color=auto"
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Load terminal
echo ""
echo -e -n "\e[32m# Preparing to start \e[0m\e[35mzsh\e[0m \e[32mshell...\e[0m"
os_system=$(uname -o)
kernel=$(uname -r)
uptime=$(uptime 2> /dev/null | tr -s " " | cut -d "," -f 1)
if [ -z "${uptime}" ] ; then
  uptime="Unknown"
else
  uptime=$(echo ${uptime})
fi
#shell="5.8" # Run zsh --version
shell=$(zsh --version | cut -d " " -f 2)
resolution=$(xrandr 2> /dev/null | grep "*" | head -1  | tr -s " " | cut -d " " -f 2)
if [ -z "${resolution}" ] ; then
  resolution="No display"
fi
user_loaded=$(whoami)
home_user="${HOME}"
if [ -f /proc/cpuinfo ] ; then
  cpu_model=$(cat /proc/cpuinfo | grep -i "model name" | head -1 | tr -s " " | cut -d ":" -f 2)
  cpu_model=$(echo ${cpu_model})
elif [ -f /usr/bin/lscpu ] ; then
  cpu_model=$(lscpu 2>/dev/null | grep -i "Model name:" | tr -s " " | cut -d ":" -f 2)
  cpu_model=$(echo ${cpu_model})
else
  cpu_model="Unknown"
fi
if [ -f /proc/meminfo ] ; then
  mem_total_kb=$(cat /proc/meminfo | grep -i "memtotal" | tr -s " " | cut -d ":" -f 2)
  mem_total_kb_num=$(echo ${mem_total_kb} | tr -s " " | cut -d " " -f 2)
  mem_total_gb=$(expr ${mem_total_kb_num} / 1000 / 1000)
  mem_total=$(echo ${mem_total_gb}G)
elif [ -f /usr/bin/lsmem ] ; then
  mem_total=$(lsmem | grep -i "total online memory:" | tr -s " " | cut -d ":" -f 2)
  mem_total=$(echo ${mem_total})
else
  mem_total="Unknown"
fi
arch_system=$(uname -m)
hostname=${HOST}
if [ -z "${XDG_SESSION_TYPE}" ] ; then
  session_type="tty"
else
  session_type="${XDG_SESSION_TYPE}"
fi

clear
echo -e "                                       "
echo -e "\e[31m         :.         .:      \e[0m"
echo -e "\e[31m      .=:             :=.   \e[0m"
echo -e "\e[31m     -+                 =-  \e[0m   \e[33mOS: \e[0m\e[35m${os_system}\e[0m"
echo -e "\e[31m    :#                   *- \e[0m   \e[33mHost: \e[0m\e[35m${hostname}\e[0m"
echo -e "\e[31m    @=                   :@ \e[0m   \e[33mKernel: \e[0m\e[35m${kernel}\e[0m"
echo -e "\e[31m   .@-                   :@:\e[0m   \e[33mUptime: \e[0m\e[35m${uptime}\e[0m"
echo -e "\e[31m    @*                   *@.\e[0m   \e[33mShell: \e[0m\e[35mzsh ${shell}\e[0m"
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
