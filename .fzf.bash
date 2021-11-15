# Setup fzf
# ---------
if [[ ! "$PATH" == */home/q3aql/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "~/.fzf/shell/key-bindings.bash"
