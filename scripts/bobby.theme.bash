#!/bin/bash

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1="\n\[\033[01;36m\] \D{%Y-%m-%d} \t\[\033[00m\] "
  #
  #PS1+="\[\033[00;31m\]o\[\033[00m\]  " # Activate this one if the one below fails
  PS1+="\[\033[00;31m\]⌚\[\033[00m\]  "
  #
  PS1+="\[\033[00;35m\]\u@\h\[\033[00m\] "
  PS1+="in "
  PS1+="\[\033[00;32m\]\w\n\[\033[00m\]"
  #
  #PS1+="\[\033[00;36m\]o\[\033[00m\] \[\033[00;32m\]→\[\033[00m\] " # Activate this one if the one below fails
  PS1+="\[\033[00;36m\]○\[\033[00m\] \[\033[00;32m\]→\[\033[00m\] " 
else 
  PS1="\n \D{%Y-%m-%d} \t "
  #
  PS1+="o  "
  #PS1+="⌚  " # Activate this line if there is symbol support
  #
  PS1+="\u@\h "
  PS1+="in "
  PS1+="\w\n"
  #
  PS1+="o → "
  #PS1+="○ → " # Activate this line if there is symbol support 
fi
unset color_prompt force_color_prompt
