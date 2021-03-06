# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable programmable completion features
# Try different location for that file, depending on Linux distros
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion # Debian-based
fi
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion # Archlinux
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ -n "`command -v __git_ps1`" ]; then 
  git_ps1="\$(__git_ps1)"
else
  git_ps1=""
fi

__ps1() {
  exit_code=$?

  if [ -n "$debian_chroot" ]; then
    echo -en "$debian_chroot"
  fi

  echo -en "\e[1;32m$(whoami)@$(hostname)\e[0m:"
  echo -en "\e[1;34m$(pwd | sed "s,^$HOME,~,")\e[0m"

  if [ -n "$VIM" ]; then
    echo -en " \e[1;31m(vimception)\e[0m"
  fi

  if [ -n "`command -v __git_ps1`" ]; then
    __git_ps1
  fi

  echo ""

  if [ $exit_code -eq 0 ]; then
    echo -en "$"
  else
    echo -en "\001\e[01;31m\002\$\001\e[00m\002"
  fi
  echo -en " "
}

if [ "$color_prompt" = yes ]; then
    PS1='$(__ps1)'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w${VIM:+ (vimception)}'$git_ps1'\n\$ '
fi
unset color_prompt force_color_prompt git_ps1

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rgrep='rgrep --color=auto'
fi

# Set default ssh-add timespan to 8 hours
alias ssh-add='ssh-add -t 28800'

alias be='bundle exec'

alias vim='vim -p'
alias viv='vim -p'

# Vim is way better than vi
export EDITOR=vim

man() {
  /usr/bin/man $1 2> >(sed 's/No manual entry for /You’re a /')
}
