#######################################################################
# OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  OS='Unknown'
fi

which plenv > /dev/null 2>&1
PLENV_BOOL=$?
which rbenv > /dev/null 2>&1
RBENV_BOOL=$?

# Unknownだったら何もしない
if [ $OS != 'Unknown' ]; then
  #######################################################################
  # set var
  export PATH="/usr/local/bin:$HOME/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
  export PATH="$HOME/.plenv/bin:$PATH"
  export PATH="$HOME/.rbenv/bin:$PATH"
  if [ $PLENV_BOOL -eq 0 ]; then
    eval "$(plenv init -)"
  fi
  if [ $RBENV_BOOL -eq 0 ]; then
    eval "$(rbenv init -)"
  fi
  WORKING_DIRECTORY='\[\e[$[COLUMNS-$(echo -n " ($(date +%H:%M:%S)" | wc -c)]C\e[1;31m($(date +%H:%M:%S))\e[0m\e[$[COLUMNS]D\]'
  export PS1=${WORKING_DIRECTORY}'\[\e[1;32m\]\u\[\e[00m\] \[\e[1;36m\][\W]\[\e[00m\]-> '
  export TERM="xterm-256color"
  export EDIOTR=vim

  ######################################################################
  # aliases
  if [ $OS == "Linux" ]; then
    alias ls='ls --color=auto'
  elif [ $OS == "Mac" ]; then
    alias ls='ls -G'
  fi
  alias ll='ls -la'
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias tmux='tmux new-session \; source-file ~/.tmux/session'
  alias be='bundle exec'
fi
