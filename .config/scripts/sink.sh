#! /bin/bash

if [ -f "$HOME/.cache/is-headphones" ];
then
  pactl set-sink-port alsa_output.pci-0000_05_00.6.analog-stereo analog-output-speaker
  pactl set-sink-volume @DEFAULT_SINK@ 100%
  pactl set-sink-mute @DEFAULT_SINK@ 0
  rm $HOME/.cache/is-headphones
  notify-send -i /usr/share/icons/Papirus-Dark/16x16/devices/audio-speakers.svg "Changed sink" "Speakers"
else
  pactl set-sink-port alsa_output.pci-0000_05_00.6.analog-stereo analog-output-headphones
  pactl set-sink-volume @DEFAULT_SINK@ 100%
  pactl set-sink-mute @DEFAULT_SINK@ 0
  echo true >> $HOME/.cache/is-headphones
  notify-send -i /usr/share/icons/Papirus-Dark/16x16/devices/audio-headphones.svg "Changed sink" "Headphones"
fi
