#!/bin/bash

umask 022

alias ls='ls -GFT'
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias -- ..='cd ../'
alias -- ...='cd ../../'
alias -- ....='cd ../../../'

if [ -d /usr/local/bin ]; then
    PATH="/usr/local/bin:${PATH}"
fi

export EDITOR="vim"

#show pwd as absolute path and make prompt colorful
export PS1="\[$(tput setaf 1)\]\\u@\\h:\\w\\$ \[$(tput sgr0)\]"

#turn off special handling of ._* files in tar, etc in MAC OS X 10.5+
export COPYFILE_DISABLE=true

#ignoredups ignorespace for bash history
export HISTCONTROL=ignoreboth:erasedups

#define how many histories that history command will return
export HISTSIZE=10000

#define how many histories can be saved in .bash_history
export HISTFILESIZE=100000

#append last command to history file when runs every command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#set ignored command list
export HISTIGNORE="ls:[bf]g:exit:pwd:clear:cd"

#add datetime to history and make it colorful
export HISTTIMEFORMAT="[$(tput setaf 6)%F %T$(tput sgr0)]: "

#save multiple line commands into a singile history line
shopt -s cmdhist

#append to history file rather than overwrite
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
