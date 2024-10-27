#!/usr/bin/env sh

# Updates Check
sleep_sec=600
i=0
while :; do
    if (( $i % 60 == 0 )); then
        updates=$(checkupdates | wc -l)
    fi
    echo "$updates"
    sleep $sleep_sec
    (( i += $sleep_sec ))
done