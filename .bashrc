# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HOSTNAME_SHORT=`hostname`
#export HISTSIZE=1000000
#export HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"
#HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# bash it
export BASH_IT="/Users/sam/.bash_it"
export BASH_IT_THEME="bobby"
source $BASH_IT/bash_it.sh

## Node version manager
#if [ -f ~/.nvm/nvm.sh ]; then
  #. ~/.nvm/nvm.sh
#fi
# use the node version 8
export PATH="/usr/local/opt/node@8/bin:$PATH"

#ndenv
#export PATH="$HOME/.ndenv/bin:$PATH"
#eval "$(ndenv init -)"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# use docker dinghy for fast containers
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.101:2376"
export DOCKER_CERT_PATH="/Users/sam/.docker/machine/machines/dinghy"
export DOCKER_MACHINE_NAME="dinghy"

export PIP_LOG_FILE=/var/tmp/pip-log.txt
export PIP_DOWNLOAD_CACHE=/var/tmp/pip_cache

export EDITOR=vim

# set up texmaker
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin/

# make sure parallel tests dont eat up the primary database
export PARALLEL_TEST_FIRST_IS_1=true

# set up the gopath
export GOPATH=/usr/local/go
export PATH=$PATH:$GOPATH/bin

# set up the cargo/rust path
export CARGO_BIN_PATH=$HOME/.cargo/bin/
export PATH=$PATH:$CARGO_BIN_PATH

export ERL_AFLAGS="-kernel shell_history enabled"
