#!/bin/bash

# Set defaults
defaultwallpaper="$HOME/wallpaper/default.jpg"
cachefile="$HOME/.config/ml4w/cache/current_wallpaper"

# Get current wallpaper
if [ -f $cachefile ] ;then
    if [ -f $(cat $cachefile) ]; then
        echo ":: Wallpaper $(cat $cachefile) exists"
        wallpaper=$(cat $cachefile)
    else
        echo ":: Wallpaper $(cat $cachefile) not exists."
        wallpaper=$defaultwallpaper
    fi
else
    echo ":: $cachefile not exists."
    wallpaper=$defaultwallpaper
fi

# Set wallpaper
echo ":: Setting wallpaper with source image $wallpaper"
waypaper --wallpaper $wallpaper