#!/bin/sh

menu() {
	printf "1. Lofi Girl\n"
	printf "2. Chillhop\n"
	printf "3. Box Lofi\n"
	printf "4. The Bootleg Boy\n"
	printf "5. Radio Spinner\n"
	printf "6. SmoothChill"
}

main() {
	choice=$(menu | rofi -i -dmenu -theme generic | cut -d. -f1)

	case $choice in
		1)
			notify-send "Now Playing: Lofi Girl ☕️🎶"
			mpv "https://play.streamafrica.net/lofiradio"
			break
			;;
		2)
			notify-send "Now Playing: Chillhop ☕️🎶"
			mpv "http://stream.zeno.fm/fyn8eh3h5f8uv"
			break
			;;
		3)
			notify-send "Now Playing: Box Lofi ☕️🎶"
			mpv "http://stream.zeno.fm/f3wvbbqmdg8uv"
			break
			;;
		4)
			notify-send "Now Playing: The Bootleg Boy ☕️🎶"
			mpv "http://stream.zeno.fm/0r0xa792kwzuv"
			break
			;;
		5)
			notify-send "Now Playing: Radio Spinner ☕️🎶"
			mpv "https://live.radiospinner.com/lofi-hip-hop-64"
			break
			;;
		6)
			notify-send "Now Playing: SmoothChill ☕️🎶"
			mpv "https://media-ssl.musicradio.com/SmoothChill"
			break
			;;
	esac
}

pkill -f http || main
