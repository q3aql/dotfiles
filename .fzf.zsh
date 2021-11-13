# Setup fzf
# ---------
if [[ ! "$PATH" == */home/q3aql/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/q3aql/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/q3aql/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/q3aql/.fzf/shell/key-bindings.zsh"
