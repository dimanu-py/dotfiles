#!/bin/bash

set -e

sleep 2

if hyprctl monitors | grep -q "DVI-I-1" && hyprctl monitors | grep -q "DVI-I-2"; then
    echo "Both DVI-I-1 and DVI-I-2 are connected"
    hyprctl keyword monitor "eDP-1, disable"
    hyprctl keyword monitor "DVI-I-1,preferred,auto,1"
    hyprctl keyword monitor "DVI-I-2,preferred,auto,1"
else
    echo "DVI-I-1 or DVI-I-2 is not connected"
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
fi