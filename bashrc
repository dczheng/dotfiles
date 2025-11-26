pkg_env() {
    if [ -d "$1/bin" ]; then
        export PATH="$1/bin:$PATH"
    fi

    if [ -d "$1/include" ]; then
        export C_INCLUDE_PATH="$1/include:$C_INCLUDE_PATH"
        export CPLUS_INCLUDE_PATH="$1/include:$CPLUS_INCLUDE_PATH"
    fi

    if [ -d "$1/lib" ]; then
        export LIBRARY_PATH="$1/lib:$LIBRARY_PATH"
        export LD_LIBRARY_PATH="$1/lib:$LD_LIBRARY_PATH"
    fi

    if [ -d "$1/lib/pkgconfig" ]; then
        export PKG_CONFIG_PATH="$1/lib/pkgconfig:$PKG_CONFIG_PATH"
    fi
}

export ZENV=$(dirname "${BASH_SOURCE[0]}")
export PATH="$ZENV/tools:$PATH"
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME:$PATH"
export NCPU=$(cat /proc/cpuinfo | grep processor -c)
export LSCOLORS="Excxaxaxdxaxaxaxaxaxax"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias cd..="cd .."
alias vi="vim"
alias ll="ls -lh"
alias la="ls -lAh"
alias laa="ls -lah"
alias df="df -h"
alias tmux-enter="tmux new -A -s "
alias sudo="sudo "
alias make="make -j$NCPU "
alias scp="scp -r "
alias gitrc="git add -u && git commit --amend"

bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "TAB: menu-complete"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [[ $- != *i* ]]; then
    return
fi

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

alias ls="ls --color"
export PS1="\[\e[0;32m\]\u@\h.\[\e[0;93m\]\W >\[\e[0m\] "
cowsay.sh "Welcome to $(cat /etc/hostname)"
