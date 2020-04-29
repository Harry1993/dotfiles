#!/bin/bash
scrot /tmp/screen.png
#convert /tmp/screen.png -scale 25% -scale 400% /tmp/screen.png
convert /tmp/screen.png -filter Gaussian -blur 0x4 /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
i3lock -i /tmp/screen.png
rm /tmp/screen.png

## turn off the screen
#sleep 5
#xset dpms force off
