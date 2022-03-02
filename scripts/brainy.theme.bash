#!/bin/bash

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1="\[\033[01;34m\]\u@\h\[\033[00m\] [\[\033[01;33m\]\w\[\033[00m\]] \[\033[01;32m\]○\[\033[00m\] \[\033[01;35m\][\[\033[00m\]\t\[\033[01;35m\]]\[\033[00m\]\n> "
else
  PS1="\u@\h [\w] ○ [\t]\n> "
  #PS1="\u@\h [\w] o [\t]\n> "
fi
unset color_prompt force_color_prompt
