#! /bin/bash

#Starts pulseaudio
if [ -z $(pgrep pulseaudio) ]; then
  pulseaudio --start &
fi

#Starts the battery status script
if [ -z $(pgrep battery-status) ]; then
  ~/.config/scripts/battery-status.sh &
fi

# Enables tap to click and natural scrolling for touchpad
~/.config/scripts/touchpad.sh &

# Enable autolock and autosleep
if [ -z $(pgrep xidlehook) ]; then
~/.config/scripts/lockscreen.sh &
fi

# Sets the background
feh --no-fehbg --bg-scale '/home/nex/Pictures/wallpapers/castle.png' &

# enables the picom compositor with blur and rounded corners (picom-ibhagwan)
if [ -z $(pgrep picom) ]; then
  picom &
fi

# launches the dunst notification daemon
if [ -z $(pgrep dunst) ]; then
  dunst &
fi

# Start up polybar
if [ -z $(pgrep polybar) ]; then
  ~/.config/polybar/launch.sh >/dev/null &
fi

# Systemtray
if [ -z $(pgrep trayer) ]; then
  trayer --edge top --align left --widthtype request --heighttype request --transparent true --alpha 255 --tint 0x08090a &
  hideIt.sh --name '^panel$' --region 0x0+-10+-40 --peek 1 -w &
fi

# Syncthing
if [ -z $(pidof syncthing | awk '{print $1}') ]; then
  syncthing >/dev/null &
  notify-send -i /usr/share/icons/Papirus/16x16/emblems/emblem-syncthing-active.svg "Syncthing activated" &
fi

# Starts keepassxc (password manager)
if [ -z $(pgrep keepassxc) ]; then
  keepassxc &
  notify-send -i /usr/share/icons/Papirus/16x16/apps/keepassxc.svg "keepassxc" "added to sys tray"
fi

