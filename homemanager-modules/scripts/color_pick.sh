#!/usr/bin/bash
op=$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:-)
echo -n "$op"| rg -o "#\S+" | tr -d '\n'| wl-copy
notify-send "Color Pick" "$op" -t 7000

