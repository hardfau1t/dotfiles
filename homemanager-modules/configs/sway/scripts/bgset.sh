#!/bin/bash

wall_dir=~/Pictures/wallpapers


hour="$(date '+%H')"
if [[  10#$hour -le 10  && 10#$hour -ge 6 ]]
then
    status="morning"
elif [[ 10#$hour -lt 17 ]]
then
    status="day"
elif [[ 10#$hour -lt 20 ]]
then
    status="evening"
else
    status="night"
 fi


wallpaper="${wall_dir}/outlet iceland - ${status}.png"
echo "$wallpaper"

pkill swaybg
swaybg -i "$wallpaper" -m fill -o 'eDP-1'



