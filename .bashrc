#######################################################################
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

  #DATE_NOW='\[\e[$[COLUMNS-$(echo -n " ($(date +%H:%M:%S)" | wc -c)]C\e[1;31m($(date +%H:%M:%S))\e[0m\e[$[COLUMNS]D\]'
  #export PS1=${DATE_NOW}"${GREEN}\h ${SKY}[\W]${PUPLE}\$(get_branch)${WHITE}-> "
  export PS1="${GREEN}\h ${SKY}[\W]${PUPLE}\$(get_branch)${WHITE}-> "
}

wktemp () {
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

#######################################################################
# OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  OS='Unknown'
fi


# Unknownだったら何もしない
if [ $OS != 'Unknown' ]; then
  #######################################################################
  # set path
  export PATH="$HOME/.rbenv/bin:$PATH"
  which rbenv > /dev/null 2>&1
  RBENV_BOOL=$?

  export PATH="/usr/local/bin:$HOME/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  if [ $RBENV_BOOL -eq 0 ]; then
    # add rubygem dir
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
  fi
  if $(which ros > /dev/null 2>&1); then
    PATH="$HOME/.roswell/bin:$PATH"
  fi
  if $(which go > /dev/null 2>&1); then
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$HOME/.rbenv/bin:$PATH"
  fi

  # set vars
  prompt
  export TERM="xterm-256color"
  export EDITOR=vim

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
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
  alias psa='ps auxw'
  alias sudo='sudo '
  if $(which systemctl > /dev/null 2>&1); then
    alias sc='systemctl'
  fi
  # bundle
  if $(which bundle > /dev/null 2>&1); then
    alias b='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias bu='bundle update'
  fi
  # git
  if $(which git > /dev/null 2>&1); then
    alias g='git'
    alias gs='git status'
    alias ga='git add'
    alias gc='git commit'
    alias gp='git push'
    alias gl='git log'
    alias gd='git diff'
  fi
  # docker
  if $(which docker > /dev/null 2>&1); then
    alias d='docker'
    alias dr='docker rm'
    alias dri='docker rmi'
    alias ds='docker stop'
    alias dp='docker ps'
    alias dv='docker volume'
    alias dim='docker images'
    alias din='docker inspect'
  fi
  # ansible
  if $(which ansible-playbook > /dev/null 2>&1); then
    alias ap='ansible-playbook'
  fi
  # python
  if [ -e "$HOME/.pyenv" ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if $(which pyenv > /dev/null 2>&1); then
      eval "$(pyenv init -)"
    fi
    
    if $(which pipenv > /dev/null 2>&1); then
      alias pv='pipenv'
    fi
  fi
  # fzf
  if $(which fzf > /dev/null 2>&1); then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    if $(which ag > /dev/null 2>&1); then
      export FZF_CTRL_T_COMMAND='ag -l -g "" --hidden'
    else
      export FZF_CTRL_T_COMMAND='find .'
    fi
    export FZF_DEFAULT_OPTS='--height 40% --reverse'
    export FZF_CTRL_R_OPTS='--sort --exact'
  fi
fi
export HISTSIZE=2000
export HISTFILESIZE=2000

