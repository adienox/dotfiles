#!/bin/bash

MESSAGE="What do you want to do "${USER^}"?"
LOCK=""
SLEEP="⏾"
POWER=""
RESTART=""
LOGOUT=""
RES=`echo "$SLEEP|$POWER|$RESTART|$LOGOUT" | rofi -dmenu -p "$MESSAGE" -sep "|" -theme powermenu -monitor -1 -kb-row-left h -kb-row-right l`
[ "$RES" = "$LOCK" ] && sleep .2 && betterlockscreen -l
[ "$RES" = "$SLEEP" ] && betterlockscreen -l & loginctl suspend
[ "$RES" = "$POWER" ] && loginctl poweroff
[ "$RES" = "$RESTART" ] && loginctl reboot
[ "$RES" = "$LOGOUT" ] && bspc quit
