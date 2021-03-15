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
bluetoothctl connect E1:50:27:77:D7:0E
