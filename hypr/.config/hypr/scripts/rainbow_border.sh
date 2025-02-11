#!/bin/bash

# List of colors for the rainbow effect
colors=("ff0000" "ff7f00" "ffff00" "00ff00" "0000ff" "4b0082" "8b00ff")

# Infinite loop to cycle through colors
while true; do
    for color in "${colors[@]}"; do
        # Set the border color using hyprctl
        hyprctl keyword general:col.active_border "0xff$color"
        # Adjust the delay (in seconds) to control the speed of the rainbow effect
        sleep 1
    done
done
