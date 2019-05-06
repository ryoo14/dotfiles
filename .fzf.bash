# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# Options
# ------------
export FZF_CTRL_T_COMMAND='find . 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_CTRL_R_OPTS='--sort --exact'
