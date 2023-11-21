#!/bin/sh

mode=$(swaymsg -t get_bar_config bar-0 | grep '"mode":' | grep -oP '".*?"' | sed -n '2p' | sed 's/"//g')

if [[ "$mode" == "invisible" ]]; then
    swaymsg bar mode dock bar-0
else
    swaymsg bar mode invisible bar-0
fi
    
