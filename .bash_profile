# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if type fcitx5 > /dev/null 2>&1; then
  fcitx5 -r -d > /dev/null 2>&1
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx5
fi
if type xbindkeys > /dev/null 2>&1; then
  xbindkeys
fi
