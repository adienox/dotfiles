#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/six.rasi -kb-row-down j -kb-row-up k"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
search=""
twitter=""
github=""
mail=""
youtube=""
if [ -f "$HOME/.cache/is-headphones" ];
then
  sink=""
else
  sink=""
fi

# Variable passed to rofi
options="$search\n$sink\n$twitter\n$github\n$mail\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Firefox" -dmenu -selected-row 0)"
case $chosen in
    $search)
        $app http://localhost &
        ;;
    $sink)
        $HOME/.config/scripts/sink.sh &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://mail.tutanota.com &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
esac

