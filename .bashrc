#!/usr/bin/env sh

umask 022

alias ls='ls -GFT' # use \ls to execute non-aliased command
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias -- ..='cd ../'
alias -- ...='cd ../../'
alias -- ....='cd ../../../'

if [ -d /usr/local/bin ]; then
    PATH="/usr/local/bin:${PATH}"
fi

if [ -d /usr/local/sbin ]; then
    PATH="/usr/local/sbin:${PATH}"
fi

if [ -d /usr/local/share/npm/bin ]; then
    PATH="/usr/local/share/npm/bin:${PATH}"
fi

if [ -d /usr/local/share/python ]; then
    PATH="/usr/local/share/python:${PATH}"
fi

if [ -d ~/bin ]; then
    PATH="~/bin:${PATH}"
fi

#show pwd as absolute path and make prompt colorful
PS1='\[$(tput setaf 2)\]\u@\h: \[$(tput setaf 4)\]\w\[$(tput setaf 5)\]'

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion

    # show dirty state
    export GIT_PS1_SHOWDIRTYSTATE=1

    # show dirty state with colorful
    export GIT_PS1_SHOWCOLORHINTS=1

    # append git-prompt to $PS1
    PS1+='$(__git_ps1 " (%s)")'
fi

#show $ prompt at new line
PS1+='\n\[$(tput setaf 1)\]\$\[$(tput sgr0)\] '
export PS1

#prevent symlink resolution
export _Z_NO_RESOLVE_SYMLINKS=1
[[ -f /usr/local/etc/profile.d/z.sh ]] && . /usr/local/etc/profile.d/z.sh

#set vim as default editor
export EDITOR="vim"

#turn off special handling of ._* files in tar, etc in MAC OS X 10.5+
export COPYFILE_DISABLE=true

#ignoredups ignorespace for bash history
export HISTCONTROL=ignoreboth:erasedups

#define how many histories that history command will return
export HISTSIZE=10000

#define how many histories can be saved in .bash_history
export HISTFILESIZE=100000

#append last command to history file when runs every command
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

#set ignored command list
export HISTIGNORE="ls:[bf]g:exit:pwd:clear:cd"

#add datetime to history and make it colorful
export HISTTIMEFORMAT="[$(tput setaf 6)%F %T$(tput sgr0)]: "

#ignore unwanted file when using bash completion
export FIGNORE="DS_Store:${FIGNORE}"

#save multiple line commands into a singile history line
shopt -s cmdhist

#append to history file rather than overwrite
shopt -s histappend

#check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

#put failed substitution command back on the command line as it has typed
shopt -s histreedit

#expand history related command rather than directly execute it
shopt -s histverify

#ignore common spelling/path mistakes for cd command
shopt -s cdspell
