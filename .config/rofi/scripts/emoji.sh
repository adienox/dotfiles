#!/bin/sh

menu() {
	cat $HOME/.config/rofi/scripts/emoji-list
}

choice=$(menu | rofi -dmenu -theme generic | awk '{print $1}')
echo $choice | xclip -i -r -sel c
