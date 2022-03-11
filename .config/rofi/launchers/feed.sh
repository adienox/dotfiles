#!/usr/bin/env bash

theme="config"

dir="$HOME/.config/rofi/launchers"

menu() {
    printf "1. Youtube+Rss\n"
    printf "2. Reddit\n"
    printf "3. Gemini\n"
    printf "4. Anime\n"
    printf "5. Wifi"
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
        $HOME/.config/scripts/wifi.sh &
        ;;
    esac
}

main
