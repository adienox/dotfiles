#!/usr/bin/env bash

theme="config"

dir="$HOME/.config/rofi/launchers"

rofi -no-lazy-grab -show drun \
-modi run,drun,window \
-theme $dir/"$theme"

