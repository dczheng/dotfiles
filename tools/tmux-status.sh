#!/bin/bash

if [ $HOSTNAME = "dczheng" ]; then
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $capacity -lt 10 ]; then
        color="red"
    fi
    ac_online=""
    if [ $(cat /sys/class/power_supply/AC/online) = "1" ]; then
        ac_online="+"
    fi
    bat="#[fg=$color]$ac_online$capacity%"
    
    net=""
    NET_DIR="/sys/class/net"
    for i in $(ls $NET_DIR); do
        if [ $i == 'lo' ]; then
            continue
        fi
        a=$(cat $NET_DIR/$i/operstate)
        if [ 'x'$a == 'xup' ]; then
           net="net"
        fi
    done
    
    echo -en "#[fg=green]$net $bat#[fg=green]"
fi
