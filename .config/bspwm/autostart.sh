#!/bin/sh
pgrep -x sxhkd > /dev/null || sxhkd &
pgrep -x picom > /dev/null || picom --daemon &
pgrep -x flameshot > /dev/null || flameshot &
pgrep -x kdeconnectd > /dev/null || /usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &
killall polybar ; bspc config top_padding 0 ; polybar mybar & polybar another &
