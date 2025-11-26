#!/bin/bash

A="/sys/class/power_supply/BAT0/capacity"
B="/sys/class/power_supply/AC/online"

bat="-"
if [ -e $A ] && [ -e $B ]; then
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $capacity -lt 10 ]; then
        color="red"
    fi
    ac_online=""
    if [ $(cat /sys/class/power_supply/AC/online) = "1" ]; then
        ac_online="+"
    fi
    bat="#[fg=$color]$ac_online$capacity%"
fi

net="offline"
A="/sys/class/net"
if [ -e $A ]; then
    for i in $(ls $A); do
        if [ $i == 'lo' ]; then
            continue
        fi

        s=$(cat $A/$i/operstate)
        if [ -z $s ]; then
            continue
        fi

        if [ $s = "up" ]; then
           net="online"
           break
        fi

    done
fi

echo -en "#[fg=green]$net $bat#[fg=green]"
