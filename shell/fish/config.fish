alias vi="vim"
alias df="df -h"
alias dh="dh -h"
alias l="ll"
alias make="make -j$(cat /proc/cpuinfo | grep processor -c) "

set -x OMP_NUM_THREADS 1
set -x LC_ALL en_US.UTF-8

#set -x GREP_COLOR "0;33"
set -xa PATH $ZCONFIG/tools
add_env $MYLOCAL
