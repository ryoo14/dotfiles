#######################################################################
# functions
function get_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function prompt {
  local  BLUE="\[\e[1;34m\]"
  local  SKY="\[\e[1;36m\]"
  local  RED="\[\e[1;31m\]"
  local  GREEN="\[\e[1;32m\]"
  local  WHITE="\[\e[00m\]"
  local  GRAY="\[\e[1;37m\]"
  local  PUPLE="\[\e[1;35m\]"

  DATE_NOW='\[\e[$[COLUMNS-$(echo -n " ($(date +%H:%M:%S)" | wc -c)]C\e[1;31m($(date +%H:%M:%S))\e[0m\e[$[COLUMNS]D\]'
  export PS1=${DATE_NOW}"${GREEN}\h ${SKY}[\W]${PUPLE}\$(get_branch)${WHITE}-> "
}

function wktemp {
  d=$(mktemp -d "${TMPDIR:-/tmp}/${1:-tmpspace}.XXXXX") && cd "$d" || exit 1
  "$SHELL"
  s=$?
  if [[ $s == 0 ]]; then
    rm -rf "$d"
  else
    echo "Directory '$d' still exists." >&2
  fi
  exit $s
}

#######################################################################
# OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  OS='Unknown'
fi

export PATH="$HOME/.plenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
which plenv > /dev/null 2>&1
PLENV_BOOL=$?
which rbenv > /dev/null 2>&1
RBENV_BOOL=$?

# Unknownだったら何もしない
if [ $OS != 'Unknown' ]; then
  #######################################################################
  # set var
  export PATH="/usr/local/bin:$HOME/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  if [ $PLENV_BOOL -eq 0 ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
  fi
  if [ $RBENV_BOOL -eq 0 ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  fi
  which go > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    export GOPATH="$HOME/.go"
  fi
  prompt
  export TERM="xterm-256color"
  export EDIOTR=vim

  ######################################################################
  ## aliases
  # OS
  if [ $OS == "Linux" ]; then
    alias ls='ls --color=auto'
  elif [ $OS == "Mac" ]; then
    alias ls='ls -G'
  fi
  alias ll='ls -la'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  #alias tmux='tmux new-session \; source-file ~/.tmux/session'
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
  # etc
  alias ap='ansible-playbook'
  # bundle
  alias b='bundle'
  alias be='bundle exec'
  alias bi='bundle install'
  alias bu='bundle update'
  # git
  alias g='git'
  alias gs='git status'
  alias ga='git add'
  alias gc='git commit'
  alias gp='git push'
  alias gl='git log'
  alias gd='git diff'
  # docker
  alias d='docker'
  alias dr='docker rm'
  alias ds='docker stop'
  alias dp='docker ps'
  alias dv='docker volume'
  alias di='docker images'
fi
