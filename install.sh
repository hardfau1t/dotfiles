#!/bin/bash

if ! which stow 2>&1 >/dev/null
then
    echo "error: stow package missing"
    exit 1
fi

#shell=fish
#shell=bash
zsh=zsh
alacritty=alacritty
gdb=gdb
mako=mako
mpd=mpd
neovim=neovim
nwg_launchers=nwg-launchers
starship=starship
sway=sway
systemd=systemd
tmux=tmux
vifm=vifm
waybar=waybar
wofi=wofi
xkb=xkb
zathura=zathura
swaylock=swaylock


for app in $zsh $alacritty $gdb $mako $mpd $neovim $nwg_launchers $starship $sway $systemd $tmux $vifm $waybar $wofi $xkb $zathura $swaylock
do
    if  ! stow $app
    then
        echo "failed to intall $app"
        exit 1
    fi
done
