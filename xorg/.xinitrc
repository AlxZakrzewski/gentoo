#!/bin/bash

while true; do
        xsetroot -name "$(date)"
        sleep 1
done &

#clibboard
clipmenud &

#bind keys
xbindkeys -f ~/.xbindkeysrc

# transparency for terminal
(sleep 1 && ~/git/gentoo/asus/xcompmgr.sh) &

# set wallpaper
~/git/gentoo/asus/fehbg.sh &

exec dwm
