#!/bin/sh
pgrep -x sxhkd > /dev/null || sxhkd &
pgrep -x flameshot > /dev/null || flameshot &
pgrep -x picom > /dev/null || picom --daemon &
killall polybar ; bspc config top_padding 0 ; polybar mybar
