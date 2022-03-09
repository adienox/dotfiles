#!/usr/bin/env bash

theme="config"

dir="$HOME/.config/rofi/launchers"

menu() {
	cat $HOME/.config/rofi/assets/emoji-list
}

choice=$(menu | rofi -dmenu -theme $dir/"$theme" | awk '{print $1}')
echo $choice | xclip -i -r -sel c
