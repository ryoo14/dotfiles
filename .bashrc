source /Users/ryo14_ana/.pythonbrew/etc/bashrc

export PATH="$HOME/.plenv/bin:$PATH:/usr/local/bin"
export PATH="$HOME/.plenv/versions/5.18.1/bin:$PATH:/Users/$USER/bin"
eval "$(plenv init -)"
. ~/.alias
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# settings for peco
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'
