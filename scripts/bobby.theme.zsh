#!/bin/zsh

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
