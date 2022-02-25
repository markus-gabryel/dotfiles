#!/bin/sh
xrandr --output HDMI-A-0 --mode 1280x720 --pos 0x0 --primary \
	--output DisplayPort-0 --mode 1280x1024 --pos 1280x-152
xwallpaper \
	--output HDMI-A-0 --zoom ~/Pictures/Walls/just-sacred-heart.png \
	--output DisplayPort-0 --zoom ~/Pictures/Walls/just-immaculated-heart.png
xsetroot -cursor_name left_ptr
xset s off
xset -dpms

setxkbmap us,us basic,intl \
	-option caps:escape \
	-option grp:shifts_toggle

pgrep -x sxhkd > /dev/null || sxhkd &
pgrep -x picom > /dev/null || picom --daemon &
pgrep -x flameshot > /dev/null || flameshot &
killall polybar ; polybar -q mybar &
