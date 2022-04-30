#!/usr/bin/env bash

dir="$HOME/.config/rofi/applets"
sinkDevice=$(pactl list sinks | awk '/Active/{print $3}')
rofi_command="rofi -theme $dir/six.rasi -kb-row-down j -kb-row-up k"

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/brave ]]; then
	app="brave"
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
github=""
mail=""
twitter=""
if [ $sinkDevice != "analog-output-speaker" ];
then
  sink=""
else
  sink=""
fi
if [ -f "$HOME/.cache/is-active-mic" ];
then
  source=""
else
  source=""
fi

# Variable passed to rofi
options="$search\n$sink\n$source\n$github\n$mail\n$twitter"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Firefox" -dmenu -selected-row 0)"
case $chosen in
    $search)
        $app http://localhost &
        ;;
    $sink)
        $HOME/.config/scripts/sink.sh &
        ;;
    $source)
        $HOME/.config/scripts/pushToTalk.py &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://mail.tutanota.com &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
esac

