#!/bin/bash

# Define colors
base="#1e1e2e"                  # Background color
accent="#cba6f7"                # Accent color (mauve)
text="#cdd6f4"                  # Text color
surface0="#313244"              # Surface color

# Run swaylock with custom options
swaylock \
    --screenshots \
    --clock \
    --indicator \
    --indicator-radius 150 \
    --indicator-thickness 10 \
    --effect-blur 7x5 \
    --effect-vignette 0.5:0.5 \
    --effect-compose "$HOME/Pictures/wallpapers/shaded_landscape.png" \
    --font "JetBrainsMono Nerd Font" \
    --font-size 90 \
    --inside-color "$base" \
    --ring-color "$accent" \
    --line-color "$surface0" \
    --key-hl-color "$accent" \
    --bs-hl-color "$red" \
    --text-color "$text" \
    --inside-wrong-color "$red" \
    --inside-clear-color "$yellow" \
    --ring-wrong-color "$red" \
    --ring-clear-color "$yellow" \
    --indicator-x-position 0 \
    --indicator-y-position -20 \
    --effect-scale 1 \
    --text-caps-lock-color "$yellow" \
    --text-clear-color "$text" \
    --text-wrong-color "$red" \
    --fade-in 0.2 \
    --show-failed-attempts
