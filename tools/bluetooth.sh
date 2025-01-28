#!/bin/bash
#bluetoothctl
#[bluetooth]# power on
#[bluetooth]# agent on
#[bluetooth]# default-agent
#[bluetooth]# scan on
#[bluetooth]# pair XX:XX:XX:XX:XX
#[bluetooth]# trust XX:XX:XX:XX:XX
#[bluetooth]# connect XX:XX:XX:XX:XX
#[bluetooth]# exit

bluetoothctl power on
bluetoothctl connect D4:B6:04:A2:3E:D6
