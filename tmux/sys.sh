#!/usr/bin/env bash

# 
# dczheng
# created 2021-01-08
#

ROOT=$(dirname $(realpath $0))

if [ $(cat /etc/hostname) = "dczheng" ]; then
    net=$($ROOT/net.sh)
    bat=$($ROOT/bat.sh BAT0 AC)
    s="#[fg=green]$net $bat#[fg=green]"
fi
echo -en $s
