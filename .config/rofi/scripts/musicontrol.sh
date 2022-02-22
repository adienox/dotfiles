#!/bin/bash

NEXT=""
PLAY="喇"
PAUSE=""
PREV="丹"
PLAYER=""
[ -n "$(playerctl -ls)" ] && TITLE=`playerctl metadata --format '{{title}}' | cut -c -65` || TITLE=`echo "No Music Playing"`
ICON=`[[ "$(playerctl metadata --format '{{lc(status)}}')" = "playing" ]] && echo $PAUSE || echo $PLAY`
RES=`echo "$PLAYER|$PREV|$ICON|$NEXT" | rofi -dmenu -p "$TITLE" -sep "|" -theme music -monitor -1 -kb-row-left h -kb-row-right l`
[ "$RES" = "$PLAY" ]  && playerctl play
[ "$RES" = "$PAUSE" ] && playerctl pause
[ "$RES" = "$PREV" ]  && playerctl previous
[ "$RES" = "$NEXT" ]  && playerctl next
[ "$RES" = "$PLAYER" ]  && $HOME/.config/scripts/sink.sh
