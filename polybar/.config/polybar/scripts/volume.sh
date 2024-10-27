#!/usr/bin/env sh

# Volume Level
sleep_sec=2
while :; do
    vol=$(pamixer --get-volume)
    if [[ $(pamixer --get-mute) == "true" ]]; then
        icon=""
    elif [ $vol -le 25 ]; then
        icon=""
    elif [ $vol -le 50 ]; then
        icon=""
    elif [ $vol -le 75 ]; then
        icon=""
    else
        icon=""
    fi
    echo "$icon $vol% "
    sleep $sleep_sec
done