#!/usr/bin/env bash

# 
# dczheng
# created 2019-07-27
#

p=$(cat /sys/class/power_supply/$1/capacity)
s=$(cat /sys/class/power_supply/$2/online)

c="green"
if [ $p -lt 10 ]; then
    c="red"
fi

i=""
if [ $s = "1" ]; then
    i="+"
fi

x="#[fg=$c]$i$p%"

echo $x
