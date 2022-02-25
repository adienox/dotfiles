#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6     style_7

theme="style_6"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"

# comment this line to disable random colors
# sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
#theme="${themes[$(( $RANDOM % 7 ))]}"
menu() {
    printf "1. Youtube+Rss\n"
    printf "2. Reddit\n"
    printf "3. Gemini\n"
    printf "4. Anime\n"
    printf "5. SSH Sentinel"
}

main() {
    choice=$(menu | rofi -i -dmenu -theme $dir/"$theme" | cut -d. -f1)

    case $choice in
      1)
        alacritty --class newsboat,rss -t Newsboat -e newsboat &
        ;;
      2)
        alacritty --class reddit,rss -t Tuir -e tuir --enable-media &
        ;;
      3)
        alacritty --class amfora,rss -t Amfora -e amfora &
        ;;
      4)
        alacritty --class anime,rss -t Anime -e ani-cli &
        ;;
      5)
        $HOME/.config/scripts/sentinel.sh &
        ;;
    esac
}

main
