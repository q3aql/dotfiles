#!/bin/bash


home=$(eval echo ~"$USER")

case $1 in
    selected-region)
        # Take a screenshot of the selected region
        grim -t jpeg -g "$(slurp)" "$home"/Pictures/Screenshots/"$(date +%Y-%m-%d_%H-%m-%s)".jpg
        ;;
    save-to-clipboard)
        # Take a screenshot and save it to the clipboard
        grim -g "$(slurp -d)" - | wl-copy
        ;;
    *)
        # Take a screenshot of all outputs and save it into screenshots
        grim -t jpeg ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).jpg
        ;;
esac
