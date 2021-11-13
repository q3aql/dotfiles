# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# locales
export LC_ALL=""
export LC_COLLATE=C
export LANG=es_ES.UTF-8


alias grep='grep --color=auto'
alias cat='batcat --style=plain --paging=never'
alias ls='exa --group-directories-first'
alias tree='exa -T'

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
# Dauert einige Zeit zum Laden, ca. 0.5 sec.
autoload -U compinit ; compinit
# U.A. farbige Completion
zmodload -i zsh/complist
autoload -U colors
colors
zstyle :compinstall filename '~/.zshrc'
# Compliations for make ...
compile=(install clean remove uninstall deinstall)
compctl -k compile make
# cd & co.: only in directories
compctl -g '*(-/)' + -g '.*(/)' cd chdir dirs pushd rmdir dircmp cl
# tar & co.: only directorys and archives
compctl -g '*.(gz|z|Z|t[agp]z|tarZ|tz)' + -g '*(-/)' gunzip gzcat zcat
# Sound: Sounds + Playlists + directorys 
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
# Maximal zwei Fehler pro Kommando.
# zstyle ':completion:*:correct:*' max-errors 2 numeric
# Fuegt den urspruenglich eingegebenen String auch als Completion auf.
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:correct:*' insert-unambiguous true # RTFM :P

# Welche Funktionen sollen zur Vervollstaendigung genutzt werden?
zstyle ':completion:*' completer _complete _correct _approximate
# Globbing
zstyle ':completion:*' glob true

# Verbose. Immer doch!
#zstyle ':completion:*' verbose yes
# Format der Corrections, Warnungen, etc.
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:messages' format $'%{\e[0;31m%}%d%{\e[0m%}'
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for: %d%{\e[0m%}'
zstyle ':completion:*' group-name ''
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Bei der Completion: Menü mit inversen aktiven Einträgen. Cool!
zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' menu select=2

# Completions für einige Programme:

# SSH - Erst User, dann Host.
zstyle ':completion:*:ssh:*' group-order 'users' 'hosts'
# rm - Reihenfolge: Erst Backupdateien, dann Bytecompiled Files,
# danach core-Files, erst dann restliche Dateien.
zstyle ':completion:*:*:rm:*' file-patterns '(*~|\\#*\\#):backup-files' '*.zwc:zsh\ bytecompiled\ files' 'core(|.*):core\ files' '*:all-files'
# kill - unglaubliche Completions!
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
# less und mutt: Umfangreiches Menü.
zstyle ':completion:*:*:less:*' menu yes select
zstyle ':completion:*:*:mutt:*' menu yes select

# bindkey
bindkey -e
bindkey "\e[3~" delete-char
# Home- und End-Keys.
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
# 2005-02-27: Navigation im Completion-Menü. GENIAL!
# Navigation in der Completion-Liste (Tab-Tab): hjkl wählt aus, Return fügt ein
# und beendet das Menü (wobei es weiterhin angezeigt wird) und i fügt ein und
# lässt das Menü offen, um eine weitere Vervollständigung einzufügen.
# Die Befehle funktionieren nur, *nachdem* zsh/complist geladen wurde!
bindkey -M menuselect 'h' vi-backward-char                # links
bindkey -M menuselect 'j' vi-down-line-or-history         # unten
bindkey -M menuselect 'k' vi-up-line-or-history           # oben
bindkey -M menuselect 'l' vi-forward-char                 # rechts
# Fügt die Completion auf der Kommandozeile ein, lässt aber das Menü
# für eine Weitere Vervollständigung offen.
bindkey -M menuselect 'i' accept-and-menu-complete
# Fügt die Completion auf der Kommandozeile ein und zeigt dann ein
# Menü mit weiterhin möglichen Completions. "Engere Auswahl"
bindkey -M menuselect 'o' accept-and-infer-next-history

# envvars
export COLORTERM=yes
export EDITOR=/usr/bin/vim
export PAGER=less
export LESS=aCeiM
export BROWSER=elinks
#export NNTPSERVER="news.task.gda.pl"
#export LS_COLORS='no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.jpg=1;32:*.jpeg=1;32:*.JPG=1;32:*.gif=1;32:*.png=1;32:*.jpeg=1;32:*.ppm=1;32:*.pgm=1;32:*.pbm=1;32:*.c=1;33:*.C=1;33:*.h=1;33:*.cc=1;33:*.awk=1;33:*.pl=1;33:*.bz2=1;35:*.gz=1;31:*.tar=1;31:*.zip=1;31:*.lha=1;31:*.lzh=1;31:*.arj=1;31:*.tgz=1;31:*.taz=1;31:*.html=1;34:*.htm=1;34:*.doc=1;34:*.txt=1;34:*.o=1;36:*.a=1;36:*.php3=1;31'
# path
export PATH=$PATH:/opt/bin:$HOME/bin

# Tetris!!
#autoload -U tetris
#zle -N tetris
#bindkey "^Xt" tetris ## C-x t to play

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
SPROMPT='zsh: korrigiere '%R' nach '%r'? ([Y]es/[N]o/[E]dit/[A]bort) '

# source them
[ -f ~/.alias/alias-general ] && source ~/.alias/alias-general
[ -f ~/.alias/alias-home ] && source ~/.alias/alias-home
[ -f ~/.alias/alias-autoliv ] && source ~/.alias/alias-autoliv
[ -f ~/.alias/alias-fs20 ] && source ~/.alias/alias-fs20

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
