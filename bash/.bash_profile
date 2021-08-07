export PATH=/home/gireesh/.local/bin:$PATH:/home/gireesh/playground/scripts:~/.cargo/bin:~/programs/stm33cubeide/
export CM_LAUNCHER=wofi
export BROWSER=firefox
export TERMINAL=alacritty
export READER=zathura
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland
export GRIM_DEFAULT_DIR=~/Pictures/grim/
export IGNOREOF=100
# For Gradle
export XDG_CONFIG_HOME=~/.config
export TERM=tmux-256color
export ZDOTDIR=~/.config/zsh
export MPC_FORMAT="%position% \t- %id% \t- %title% \t- %file%"
export GTK_THEME=Adwaita:dark
source "$HOME/.cargo/env"
XCURSOR_THEME=bibata
XCURSOR_SIZE=32

alias sway="sway > /tmp/sway.log 2>&1"
if [[ $(tty) = /dev/tty1 ]]; then
	sway
fi
