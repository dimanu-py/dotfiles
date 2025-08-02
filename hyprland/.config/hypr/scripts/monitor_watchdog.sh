#!/bin/bash

get_monitors_connected() {
    hyprctl monitors | grep "Monitor" | wc -l
}

action_on_change() {
    echo "$(date): Monitor connection changed" >> /tmp/monitor_watchdog.log
    bash "$HOME/.config/hypr/conf/monitors/dynamic_enable.sh"
}

previous_state=$(get_monitors_connected)

while true; do
    sleep 1
    current_state=$(get_monitors_connected)

    if [ "$current_state" -ne "$previous_state" ]; then
        action_on_change
        previous_state=$current_state
    fi
done