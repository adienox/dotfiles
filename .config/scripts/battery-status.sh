#!/bin/bash

while true; do
	battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	adapter=$(acpi -a | awk '{print $3}')
	if [[ ($battery_level -ge 100) && ($adapter == 'on-line') ]]; then
		notify-send -i /usr/share/icons/Papirus-Dark/16x16/devices/audio-battery.svg "Battery Full" "Level: ${battery_level}%"
		paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
	elif [[ ($battery_level -le 20) && ($adapter == 'off-line') ]]; then
		notify-send -i /usr/share/icons/Papirus-Dark/16x16/devices/audio-battery.svg --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
		paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
	fi
	sleep 60
done
