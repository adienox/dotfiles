#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

theme="style_6"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"

menu() {
	cat $HOME/.config/rofi/assets/emoji-list
}

choice=$(menu | rofi -dmenu -theme $dir/"$theme" | awk '{print $1}')
echo $choice | xclip -i -r -sel c
