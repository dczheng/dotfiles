#!/bin/bash

MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
VAL=$1

if [ -z $1 ]; then
    VAL=$MAX
fi

echo $VAL"/"$MAX
echo $VAL | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
