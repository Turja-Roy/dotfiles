#!/bin/bash

if [ "$1" == "next" ]; then
    variety -n
elif [ "$1" == "prev" ]; then
    variety -p
else
    echo "Usage: $0 {next|prev}"
    exit 1
fi

sleep 1

wal -i "$(cat ~/.config/variety/wallpaper/wallpaper.jpg.txt)" -n -q -s -t -e

pkill waybar && waybar &
