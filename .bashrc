# ---------------------------------------------------------------------------
# functions
get_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt () {
  if [[ "$TERM" =~ 256color ]]; then
    local HN="\[\033[38;5;246m\]\H\[\033[0m\]"
    local CD="\[\033[38;5;045m\]\W\[\033[0m\]"
    local BRANCH="\[\033[38;5;097m\]\$(get_branch)\[\033[0m\]"
    local ARROW="\[\033[38;5;208m\]>\[\033[0m\]\[\033[38;5;220m\]>\[\033[0m\]\[\033[38;5;082m\]>\[\033[0m\]"
    export PS1="${HN} ${CD}${BRANCH} ${ARROW} "
  else
    local BLUE="\[\e[1;34m\]"
    local SKY="\[\e[1;36m\]"
    local RED="\[\e[1;31m\]"
    local GREEN="\[\e[1;32m\]"
    local WHITE="\[\e[00m\]"
    local GRAY="\[\e[1;37m\]"
    local PUPLE="\[\e[1;35m\]"
    export PS1="${SKY}[\W]${GREEN}\$(get_branch)${WHITE}-> "
  fi
}

check_command () {
  which $1 > /dev/null 2>&1
}

mkig () {
  curl -L -s https://www.gitignore.io/api/$@
}

fzf_ghq() {
  local project_name=$(wh list | sort | $(__fzfcmd))
  if [[ -n "$project_name" ]]; then
    local project_full_path=$(wh root)/$project_name
    local project_relative_path="~/$(realpath --relative-to=$HOME $project_full_path)"
    READLINE_LINE="cd $project_relative_path"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
bind -x '"\C-]": fzf_ghq'

fwh() {
  local project_name=$(wh list | sort | $(__fzfcmd))
  if [[ -n "$project_name" ]]; then
    cd $project_name
  fi
}

fssh() {
  local ssh_login_host=$(cat ~/.ssh/config | grep -i ^host | awk '{print $2}' | $(__fzfcmd))
  if [[ -n "$ssh_login_host" ]]; then
    ssh $ssh_login_host
  fi
}

# ---------------------------------------------------------------------------
# set OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  # Catalinaではzshでないと警告が出るようになったのでそれを抑制
  export BASH_SILENCE_DEPRECATION_WARNING=1
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  OS='Unknown'
fi


# ---------------------------------------------------------------------------
# settings
if [ $OS = 'Mac' -o $OS = 'Linux' ]; then

  # set path
  export PATH="/usr/local/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

  # set vars
  export TERM="xterm-256color"
  prompt
  export EDITOR=vim
  export HISTSIZE=20000
  export HISTFILESIZE=20000

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
  alias v='vim'

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
  if [ -e "$HOME/.go" ]; then
    export GOPATH="$HOME/.go"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$GOPATH/bin:$PATH"
    if [ -e "$HOME/.goenv" ]; then
      export GOENV_ROOT="$HOME/.goenv"
      export PATH="$GOENV_ROOT/bin:$PATH"
      if check_command goenv; then
        export GOENV_DISABLE_GOPATH=1
        eval "$(goenv init -)"
        alias gv='goenv'
      fi
    fi
  fi

  ## rust
  if [ -e "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    if check_command cargo; then
      alias c='cargo'
      alias cr='cargo run'
      alias ci='cargo install'
      alias cu='cargo update'
      alias cb='cargo build'
    fi
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
    source "$HOME/dotfiles/bash/git-completion.bash"
  fi

  ## docker
  if check_command docker; then
    alias dc='docker container'
    alias di='docker image'
    alias dn='docker network'
    alias dv='docker volume'
    alias dcu='docker-compose up -d'
    alias dcd='docker-compose down'
  fi

  ## ansible
  if check_command ansible-playbook; then
    alias ap='ansible-playbook'
  fi

  ## fzf
  if [ -d ~/.fzf ]; then
    export FZFPATH="$HOME/.fzf"
    export PATH="$FZFPATH/bin:$PATH"
    source "$FZFPATH/shell/key-bindings.bash"
    export FZF_DEFAULT_OPTS='--reverse'
    export FZF_ALT_C_COMMAND='find . -type d -name ".git" -prune -o -type d -name "*" -print'
    export FZF_CTRL_T_COMMAND='find . -type d -name ".git" -prune -o -type d -name "*" -print'
  fi

  ## hub
  if check_command hub; then
    eval "$(hub alias -s)"
  fi
fi

eval `dircolors | sed -e 's/;34:/;32:/'`
