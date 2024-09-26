#!/bin/bash
if type "xrandr"; then
  for monitor_name in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # if [ "$monitor_name" = "eDP" ]; then
    #     continue
    # fi
    MONITOR=$monitor_name polybar --reload toph &
  done
else
  polybar --reload toph &
fi
