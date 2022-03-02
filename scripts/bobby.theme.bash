#!/bin/bash

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1="\n\[\033[01;36m\] \D{%Y-%m-%d} \t\[\033[00m\] \[\033[00;31m\]○\[\033[00m\]  \[\033[00;35m\]\u@\h\[\033[00m\] in \[\033[00;32m\]\w\n\[\033[00m\]\[\033[00;36m\]○\[\033[00m\] \[\033[00;32m\]→\[\033[00m\] "
else
  PS1="\n \D{%Y-%m-%d} \t ○  \u@\h in \w\n○ → "
  #PS1="\n \D{%Y-%m-%d} \t o  \u@\h in \w\no -> "
fi
unset color_prompt force_color_prompt
