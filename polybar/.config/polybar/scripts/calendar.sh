#!/usr/bin/env sh

# Variables for date format and dimensions
WIDTH=${WIDTH:-200}
HEIGHT=${HEIGHT:-200}
DATEFMT=${DATEFMT:-"+%Y-%m-%d %H:%M:%S"}

# Display the current date in Polybar
echo "$(date "$DATEFMT")"

# If clicked (using Polybar click event), show calendar popup
if [ "$1" = "click" ]; then
    posX=$(($BLOCK_X - $WIDTH / 2))
    posY=$(($BLOCK_Y - $HEIGHT))
    
    i3-msg -q "exec yad --calendar \
        --width=$WIDTH --height=$HEIGHT \
        --undecorated --fixed \
        --close-on-unfocus --no-buttons \
        --posx=$posX --posy=$posY \
        > /dev/null"
fi

