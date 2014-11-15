# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set up a way to launch commands within screen
# run like `> POST_INIT="source /some/venv/bin/activate" screen`
if [[ $POST_INIT ]]; then
  eval $POST_INIT
fi

# Node version manager
if [ -f ~/.nvm/nvm.sh ]; then
  . ~/.nvm/nvm.sh
  nvm use v0.10.8 >> /dev/null
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -d ~/.rbenv/bin ]; then
  # ruby version manager
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PIP_LOG_FILE=/var/tmp/pip-log.txt
export PIP_DOWNLOAD_CACHE=/var/tmp/pip_cache
export EDITOR=vim
