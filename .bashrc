#######################################################################
# set var
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.plenv/bin:$HOME/.plenv/versions/5.18.1/bin:/usr/local/bin:$HOME/bin:$PATH"
eval "$(plenv init -)"
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PS1='\[\e[1;36m\][ \W ] \t \[\e[00m\]\n\[\e[1;32m\][\u]\[\e[00m\]$ '

######################################################################
# aliases
alias ls='ls -G --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
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
    local DIRS=$(ls -la | grep "^d" | awk '{print $9}' | peco)
    if [ $DIRS = "." ]; then
        cd $DIRS
    else
        cd $DIRS
        cdp
    fi
}
#######################################################################
# 外部ファイル
source $HOME/.pythonbrew/etc/bashrc

export EDITOR=vim
