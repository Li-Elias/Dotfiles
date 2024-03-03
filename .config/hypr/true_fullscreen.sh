#!/usr/bin/env bash

border_size=$(hyprctl getoption  general:border_size -j | jq .int)

pkill -SIGUSR1 waybar
if [[ $border_size == 2 ]] then
    hyprctl keyword general:border_size 0
elif [[ $border_size == 0 ]] then
    hyprctl keyword general:border_size 2
fi
hyprctl dispatch fullscreen 1
