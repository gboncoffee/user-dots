# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# fancy prompt
reset=$(tput sgr0)
bold=$(tput bold)
white=$(tput setaf 7)
magenta=$(tput setaf 5)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
PS1="\\[$cyan\\]\\u\\[$bold\\]\\[$white\\]@\\[$reset\\]\\[$magenta\\]\\h\\[$bold\\]\\[$green\\] :: \\[$blue\\]\\w \\[$yellow\\]λ\\[$reset\\] "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if on kitty, create the alias for ssh
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias n=nnn

if [ -t 1 ]
then
    bind '"\C-k":history-search-backward'
    bind '"\C-j":history-search-forward'

    echo '/\_/\'
    echo '=^.^='
fi
