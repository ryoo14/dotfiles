# ---------------------------------------------------------------------------
# functions
get_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt () {
  local  BLUE="\[\e[1;34m\]"
  local  SKY="\[\e[1;36m\]"
  local  RED="\[\e[1;31m\]"
  local  GREEN="\[\e[1;32m\]"
  local  WHITE="\[\e[00m\]"
  local  GRAY="\[\e[1;37m\]"
  local  PUPLE="\[\e[1;35m\]"

  # 時間ありver
  # DATE_NOW='\[\e[$[COLUMNS-$(echo -n " ($(date +%H:%M:%S)" | wc -c)]C\e[1;31m($(date +%H:%M:%S))\e[0m\e[$[COLUMNS]D\]'
  # export PS1=${DATE_NOW}"${GREEN}\h ${SKY}[\W]${PUPLE}\$(get_branch)${WHITE}-> "
  export PS1="${GREEN}\h ${SKY}[\W]${PUPLE}\$(get_branch)${WHITE}-> "
}

check_command () {
  eval which $1 > /dev/null 2>&1
}

wkt () {
  (
  d=$(mktemp -d "${TMPDIR:-/tmp}/${1:-tmpspace}.XXXXX") && cd "$d" || exit 1
  "$SHELL"
  s=$?
  if [[ $s == 0 ]]; then
    rm -rf "$d"
  else
    echo "Directory '$d' still exists." >&2
  fi
  exit $s
  )
}

mkgi () {
  curl -L -s https://www.gitignore.io/api/$@
}

# ---------------------------------------------------------------------------
# set OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  OS='Unknown'
fi


# ---------------------------------------------------------------------------
# settings
if [ $OS = 'Mac' -o $OS = 'Linux' ]; then

  # set path
  export PATH="/usr/local/bin:$HOME/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

  # set vars
  prompt
  export TERM="xterm-256color"
  export EDITOR=vim
  export HISTSIZE=2000
  export HISTFILESIZE=2000

  # set aliases and command preparation
  if [ $OS == "Linux" ]; then
    alias ls='ls --color=auto'
  elif [ $OS == "Mac" ]; then
    alias ls='ls -G'
  fi
  alias ll='ls -la'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
  alias psa='ps auxw'
  alias sudo='sudo '

  ## ruby
  if [ -e "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    if check_command rbenv; then
      eval "$(rbenv init -)"
      PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
      alias rv='rbenv'
    fi
  fi

  ## go
  if [ -e "$HOME/.goenv" ]; then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
    if check_command goenv; then
      eval "$(goenv init -)"
      export PATH="$GOROOT/bin:$PATH"
      export PATH="$GOPATH/bin:$PATH"
      alias gv='goenv'
    fi
  fi

  ## rust
  if [ -e "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
  fi

  ## systemctl
  if check_command systemctl; then
    alias sc='systemctl'
  fi

  ## bundle
  if check_command bundle; then
    alias b='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias bu='bundle update'
  fi

  ## git
  if check_command git; then
    alias g='git'
    alias gs='git status'
    alias ga='git add'
    alias gc='git commit'
    alias gp='git push'
    alias gl='git log'
    alias gd='git diff'
  fi

  ## docker
  if check_command docker; then
    alias dc='docker container'
    alias di='docker image'
    alias dn='docker network'
    alias dv='docker volume'
  fi

  ## ansible
  if check_command ansible-playbook; then
    alias ap='ansible-playbook'
  fi

  ## fzf
  if check_command fzf; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  fi

  ## hub
  if check_command hub; then
    eval "$(hub alias -s)"
  fi
fi
