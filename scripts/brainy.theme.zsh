#!/bin/zsh

# Detect prompt color
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1="
%F{blue}%n@%m %F{default}[%F{yellow}%/%f] %F{green}○ %F{magenta}[%F{default}%*%F{magenta}]
%F{default}> "
else
  PS1="
%n@%m [%/%f] ○ [%*]
> "
  #PS1="%n@%m [%/%f] o [%*]
#> "
fi

