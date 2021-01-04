# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if type ibus-daemon > /dev/null 2>&1; then
  ibus-daemon -drx
fi
if type setxkbmap > /dev/null 2>&1; then
  setxkbmap -option ctrl:nocaps
fi
if type xbindkeys > /dev/null 2>&1; then
  xbindkeys
fi
