export ZDOTDIR="$HOME/.config/zsh"
export LESSHISTFILE="-"
export EDITOR="nvim"
export TERM="alacritty"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
