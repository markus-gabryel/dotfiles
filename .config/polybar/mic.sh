#!/bin/sh
ON=
OFF=

[ "$1" = '-' ] && amixer -q -D pulse sset Capture toggle

(amixer -D pulse sget Capture | grep -q -m 1 '^ *Front Left:.*\[on\]') && echo $ON || echo $OFF
