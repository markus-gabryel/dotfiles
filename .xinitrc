# Monitors
xrandr --output HDMI-A-0 --mode 1280x720 --pos 0x0 --primary \
	--output DisplayPort-0 --mode 1280x1024 --pos 1280x-152
xwallpaper \
	--output HDMI-A-0 --zoom ~/Pictures/Walls/jesus-and-mary.jpg \
	--output DisplayPort-0 --zoom ~/Pictures/Walls/joseph.png
xsetroot -cursor_name left_ptr

# No screen saving
xset s off
xset -dpms

# Keyboard
setxkbmap us,us basic,intl \
	-option caps:escape \
	-option grp:shifts_toggle
xset r rate 280 35

# DWM go brrr
picom --daemon
statusbar &
exec dwm
