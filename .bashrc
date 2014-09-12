#######################################################################
# set var
export PATH="$HOME/.plenv/bin:/$HOME/.plenv/versions/5.18.1/bin:$PATH:/usr/local/bin:$HOME/bin"
eval "$(plenv init -)"
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PS1='[\u@\h] [\W]\n[$(date | cut -d " " -f 2) \t]$'
######################################################################
# aliases
alias cdpy="cd project/python;clear;ls"
alias cdshell="cd project/shell;clear;ls"
alias ll='ls -la'
alias cdp='peco-cd'

######################################################################
# settings for peco
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'

peco-cd() {
    local PWD=$(ls -la | grep "^d" | awk '{print $9}' | peco)
    if [ $PWD = "." ]; then
        cd $PWD
    else
        cd $PWD
        cdp
    fi
}

#######################################################################
# 外部ファイル
source /Users/ryo14_ana/.pythonbrew/etc/bashrc
