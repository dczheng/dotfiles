set Cyan="%{\033[0;36m%}"
set BoldCyan="%{\033[1;36m%}"
set Red="%{\033[0;31m%}"
set Green="%{\033[0;32m%}"
set Yellow="%{\033[0;33m%}"
set Blue="%{\033[0;34m%}"
set Purple="%{\033[0;35m%}"
set White="%{\033[0;37m%}"
set Normal="%{\033[0m%}"

alias h     history 25
alias ls    ls -G
alias la    ls -aF
alias lf    ls -FA
alias ll    ls -lAhF
alias vi    vim
alias l     ll

setenv LANG "en_US.UTF-8"
setenv EDITOR vi
setenv PAGER less
setenv PATH "$ZENV/tools:$ZLOCAL/bin:$PATH"

if ( ! $?C_INCLUDE_PATH ) then
    setenv C_INCLUDE_PATH "$ZENV/include"
else
    setenv C_INCLUDE_PATH "$ZENV/include:$C_INCLUDE_PATH"
endif

if ( ! $?CPLUS_INCLUDE_PATH ) then
    setenv CPLUS_INCLUDE_PATH "$ZENV/include"
else
    setenv CPLUS_INCLUDE_PATH "$ZENV/include:$CPLUS_INCLUDE_PATH"
endif

if ( ! $?LIBRARY_PATH ) then
    setenv LIBRARY_PATH            "$ZENV/lib"
else
    setenv LIBRARY_PATH            "$ZENV/lib:$LIBRARY_PATH"
endif

if ( ! $?LD_LIBRARY_PATH ) then
    setenv LD_LIBRARY_PATH            "$ZENV/lib"
else
    setenv LD_LIBRARY_PATH            "$ZENV/lib:$LD_LIBRARY_PATH"
endif

if ( ! $?PKG_CONFIG_PATH ) then
    setenv PKG_CONFIG_PATH            "$ZENV/lib"
else
    setenv PKG_CONFIG_PATH            "$ZENV/share/pkgconfig:$PKG_CONFIG_PATH"
endif

set prompt="${Cyan}%n@%m${Yellow}.%c >${Normal} "
