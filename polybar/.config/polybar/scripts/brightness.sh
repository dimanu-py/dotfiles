#!/usr/bin/env sh

# Brightness Level
sleep_sec=2
while :; do
    (( br = $(brightnessctl get) * 100 / 255 ))
    if [ $br -le 25 ]; then
        icon=""
    elif [ $br -le 50 ]; then
        icon=""
    elif [ $br -le 75 ]; then
        icon=""
    else
        icon=""
    fi
    echo "$icon $br% "
    sleep $sleep_sec
done