#!/bin/sh

export NO_AT_BRIDGE=1
eval $(dbus-launch --sh-syntax)
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
export DBUS_SESSION_BUS_WINDOWID
export AWT_TOOLKIT=MToolkit

export TERM="alacritty"
exec bspwm
