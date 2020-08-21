# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ryoo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ryoo/.fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/home/ryoo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ryoo/.fzf/shell/key-bindings.bash"
