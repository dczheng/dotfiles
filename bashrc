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

    if [ -d "$1/share/man" ]; then
        export MANPATH="$1/share/man:$MANPATH"
    fi

    if [ -n "$PYTHONVERSION" ]; then
        if [ -d "$1/lib/python$PYTHONVERSION/dist-packages" ]; then
            export PYTHONPATH="$1/share/man:$PYTHONPATH"
        fi
    fi
}

export ZENV=$(dirname "${BASH_SOURCE[0]}")
export PATH="$ZENV/tools:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME:$PATH"
export NCPU=$(cat /proc/cpuinfo | grep processor -c)
export EDITOR="vim"
export HISTIGNORE="cd:ls:ll"
export CCACHE_DIR="$HOME/.cache/ccache"
export CCACHE_SIZE=4294967296
export LESSHISTFILE="-"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias cd..="cd .."
alias cdz="cd $ZENV"
alias cdl="cd $HOME/.local"
alias vi="vim"
alias l="ls"
alias s="ls"
alias ll="ls -lh"
alias la="ls -lAh"
alias laa="ls -lah"
alias df="df -h"
alias tmux-enter="tmux new -A -s"
alias sudo="sudo "
alias make="make -j$NCPU"
alias scp="scp -r"
alias gitrc="git add -u && git commit --amend"
alias zenv=". ${HOME}/.bashrc"
alias im="nomacs"
alias pdf="chromium"
alias gitstatus="git status"
alias gitpush="git push"
alias gitadd="git add"
alias gitdiff="git diff"
alias sys="sudo systemctl"

if [[ $- != *i* ]]; then
    return
fi

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

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
fi

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

export PS1="\[\e[0;32m\]\u@\h \[\e[0;93m\]\W >\[\e[0m\] "

if shopt -q login_shell; then
    cowsay.sh "Welcome to $HOSTNAME"
fi
