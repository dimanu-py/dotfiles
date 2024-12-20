#!/bin/bash

# baraction.sh for spectrwm status bar
# https://github.com/conformal/spectrwm

# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

icon() {
    echo "+@fg=1;$1+@fg=0;"
}

percentage() {
    current=`echo $1 | sed 's/%//'`
    if [ $current -le 25 ]; then 
        echo "$(icon $2)"
    elif [ $current -le 50 ]; then
        echo "$(icon $3)"
    elif [ $current -le 75 ]; then
        echo "$(icon $4)"
    else
        echo "$(icon $5)"
    fi
}

sleep_sec=2
i=0
while :; do
    # Updates
    if (( $i % 60 == 0 )); then
        updates=`checkupdates | wc -l`
    fi
    echo "$(icon  ) $updates "

    # Brightness
    (( br = $(brightnessctl get) * 100 / 255 ))
    echo "$(percentage $br        ) $br% "

    # Volume
    vol=`pamixer --get-volume`
    if [[ `pamixer --get-mute` == "true" ]]; then
        echo "$(icon ﱝ ) $vol% "
    else
        echo "$(percentage $vol   奔 墳   ) $vol% "
    fi

    # Battery
    if (( $i % 60 == 0 )); then
        bat=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
            grep percentage |
            sed 's/ *percentage: *//g'`

        state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
            grep state |
            sed 's/ *state: *//'`
    fi
    if [ $state == "charging" -o $state == "fully-charged" ]; then
        echo "$(icon  ) "
    else
        echo "$(percentage $bat            )  "
    fi
    echo "$bat "

    # # Date
    # if (( $i % 60 == 0 )); then
    #     dte="$(date +"$(icon  ) %d/%m/%Y $(icon  ) %H:%M")"
    # fi
    # echo -e "$dte"

	# sleep $sleep_sec
    # (( i += $sleep_sec ))
done