#!/bin/bash

# ---------------------------------------------------------------------------
## functions
# for prompt
get_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt () {
  if [[ "$TERM" =~ 256color ]]; then
    local HN="\[\033[38;5;245m\]\h\[\033[0m\]" 
    local CD="\[\033[38;5;216m\]\W\[\033[0m\]" 
    local BRANCH="\[\033[38;5;116m\]\$(get_branch)\[\033[0m\]"
    local ARROW="\[\033[38;5;245m\]>\[\033[0m\]\[\033[38;5;242m\]>\[\033[0m\]\[\033[38;5;239m\]>\[\033[0m\]"
    export PS1="${HN} ${CD}${BRANCH} ${ARROW} "
  else
    #local BLUE="\[\e[1;34m\]"
    local SKY="\[\e[1;36m\]"
    #local RED="\[\e[1;31m\]"
    local GREEN="\[\e[1;32m\]"
    local WHITE="\[\e[00m\]"
    #local GRAY="\[\e[1;37m\]"
    #local PUPLE="\[\e[1;35m\]"
    export PS1="${SKY}[\W]${GREEN}\$(get_branch)${WHITE}-> "
  fi
}

# for bashrc
check_command () {
  which "$1" > /dev/null 2>&1
}

fzf_patty_lin() {
  local fzf_cmd
  fzf_cmd=$(__fzfcmd)
  local project_name
  project_name=$(patty list | sort | $fzf_cmd)
  if [[ -n "$project_name" ]]; then
    local project_full_path
    project_full_path=$(patty root)/$project_name
    local project_relative_path
    project_relative_path="~/$(realpath --relative-to=$HOME $project_full_path)"
    READLINE_LINE="cd $project_relative_path"
    READLINE_POINT=${#READLINE_LINE}
  fi
}

fzf_patty_mac() {
  local fzf_cmd
  fzf_cmd=$(__fzfcmd)
  local project_name
  project_name=$(patty list | sort | $fzf_cmd)
  if [[ -n "$project_name" ]]; then
    if [[ -t 1 ]]; then
      cd "$(patty root)/${project_name}" || return 1
    fi
  fi
}

#fpatty() {
#  local project_name=$(patty list | sort | $(__fzfcmd))
#  if [[ -n "$project_name" ]]; then
#    cd "$project_name"
#  fi
#}

# custom
mkig () {
  curl -L -s "https://www.gitignore.io/api/$*"
}

fssh() {
  local fzf_cmd
  fzf_cmd=$(__fzfcmd)
  local ssh_login_host
  ssh_login_host=$(cat ~/.ssh/config | grep -i ^host | awk '{print $2}' | $fzf_cmd)
  if [[ -n "$ssh_login_host" ]]; then
    ssh "$ssh_login_host"
  fi
}

fgc() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# ---------------------------------------------------------------------------
# set OS
if [[ "$(uname)" == 'Darwin' ]]; then
  OS='Mac'
  # Catalinaではzshでないと警告が出るようになったのでそれを抑制
  export BASH_SILENCE_DEPRECATION_WARNING=1
  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
  OS='Linux'
else
  OS='Unknown'
fi


# ---------------------------------------------------------------------------
# settings
if [[ $OS = 'Mac' || $OS = 'Linux' ]]; then

  # set path
  export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

  # set vars
  export TERM="xterm-256color"
  prompt
  export EDITOR=vim
  export HISTSIZE=20000
  export HISTFILESIZE=20000

  # set aliases and command preparation
  if [[ $OS == "Linux" ]]; then
    alias ls='ls --color=auto'
  elif [[ $OS == "Mac" ]]; then
    alias ls='ls -G'
  fi
  alias l='ls'
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
  if [[ -d "$HOME/.rbenv" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    if check_command rbenv; then
      eval "$(rbenv init -)"
      PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
      alias rv='rbenv'
    fi
  fi

  ## bundle
  if check_command bundle; then
    alias b='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias bu='bundle update'
  fi

  ## systemctl
  if check_command systemctl; then
    alias sc='systemctl'
  fi

  ## git
  if check_command git; then
    alias g='git'
    alias ga='git add'
    alias gb='git branch'
    alias gc='git commit'
    alias gch='git checkout'
    alias gl='git log'
    alias gpl='git pull'
    alias gps='git push'
    alias gs='git status'
    alias gt='git tag'
  fi

  ## docker
  if check_command docker; then
    alias dc="docker"
    alias dcc='docker container'
    alias dci='docker image'
    alias dcn='docker network'
    alias dcv='docker volume'
    alias dcu='docker-compose up -d'
    alias dcd='docker-compose down'
    alias r='docker run -it --rm -v $(pwd):/root/work ryoo/devcon .'
  fi

  ## ansible
  if check_command ansible-playbook; then
    alias ap='ansible-playbook'
  fi

  ## fzf
  if [[ -d ~/.fzf ]]; then
    export FZFPATH="$HOME/.fzf"
    export PATH="$FZFPATH/bin:$PATH"
    export FZF_DEFAULT_OPTS='--reverse'
    export FZF_ALT_C_COMMAND='find . -type d -name ".git" -prune -o -type d -name "*" -print'
    export FZF_CTRL_T_COMMAND='find . -type d -name ".git" -prune -o -type d -name "*" -print'
    source "$FZFPATH/shell/key-bindings.bash"

    if [[ $- == *i* ]];then
      if [[ $OS == "Linux" ]]; then
        bind -x '"\C-]": fzf_patty_lin'
      elif [[ $OS == "Mac" ]]; then
        bind -x '"\C-]": fzf_patty_mac'
      fi
    fi
  fi

  ## hub
  if check_command hub; then
    eval "$(hub alias -s)"
  fi

  if check_command firefox; then
    export MOZ_ENABLE_WAYLAND=1 
  fi

  ## deno
  if [[ -d "$HOME/.dvm" ]]; then
    export DVM_DIR="$HOME/.dvm"
    export PATH="$DVM_DIR/bin:$PATH"
  fi
  if [[ -d "$HOME/.deno" ]]; then
    export PATH="$HOME/.deno/bin:$PATH"
    alias d='deno'
    alias dr='deno run'
    alias dt='deno task'
    alias di='deno install'
  fi

  ## node & npm
  if check_command npm; then
    alias n='npm'
    alias ni='npm install'
    alias nr='npm run'
    alias nx='npx'
  fi

  ## gcloud
  if [[ -d "$HOME/.local/google-cloud-sdk" ]]; then
    export PATH="$HOME/.local/google-cloud-sdk/bin:$PATH"
    if [ -f '/Users/ryoo/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ryoo/Downloads/google-cloud-sdk/completion.bash.inc'; fi
  fi

  ## kubectl
  if check_command kubectl; then
    alias k='kubectl'
  fi

  ## cargo
  if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    if check_command cargo; then
      alias c='cargo'
    fi
  fi

  ## bash completion
  if check_command patty; then
    COMPLETION_DIR="$(patty root)/github.com/ryoo14/dotfiles/bash"
    if [[ -d "$COMPLETION_DIR" ]]; then
      for file in "$COMPLETION_DIR"/*; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
      done
    fi
  fi
fi

export LC_CTYPE="en_US.UTF-8"
