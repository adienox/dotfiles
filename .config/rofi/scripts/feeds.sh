#!/bin/sh

menu() {
    printf "1. Youtube+Rss\n"
    printf "2. Reddit\n"
    printf "3. Gemini\n"
    printf "4. Anime\n"
    printf "5. SSH Sentinel"
}

main() {
    choice=$(menu | rofi -i -dmenu -theme generic | cut -d. -f1)

    case $choice in
      1)
        alacritty --class newsboat,rss -t Newsboat -e newsboat
        break
        ;;
      2)
        alacritty --class reddit,rss -t Tuir -e tuir --enable-media
        break
        ;;
      3)
        alacritty --class amfora,rss -t Amfora -e amfora
        break
        ;;
      4)
        alacritty --class anime,rss -t Anime -e ani-cli
        break
        ;;
      5)
        $HOME/.config/scripts/sentinel.sh &
        break
        ;;
    esac
}

main
