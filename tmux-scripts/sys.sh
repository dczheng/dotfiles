#!/usr/bin/env bash

# 
# dczheng
# created 2021-01-08
#

if [[ `cat /etc/hostname` = "dczheng" ]]
then
    net=`$ZCONFIG/tmux-scripts/net.sh`
    bat=`$ZCONFIG/tmux-scripts/bat.sh BAT0 AC`
    s="#[fg=green]$net $bat#[fg=green]"
fi
echo -en $s
