#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    '$HOME/.config/scripts/lockFade.sh fade'\
    '$HOME/.config/scripts/lockFade.sh restore'\
  `# Undim & lock after 15 more seconds` \
  --timer 15 \
    '$HOME/.config/scripts/lockFade.sh restore; betterlockscreen -l' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
    'loginctl suspend' \
    ''
