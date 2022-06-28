export PATH=~/.local/bin:$PATH

export CM_LAUNCHER=fuzzel
export BROWSER=firefox
export TERMINAL=alacritty
export READER=zathura
export GRIM_DEFAULT_DIR=~/Pictures/grim/
export IGNOREOF=100
export XDG_CONFIG_HOME=~/.config
export XDG_LIB_DIR=~/.local/share/lib
export XDG_CURRENT_DESKTOP=sway
export XDG_CACHE_DIR=~/.cache
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export MPC_FORMAT="%position% \t- %id% \t- %title% \t- %file%"
export PASSWORD_STORE_DIR=~/.config/password-store
export GNUPGHOME="~/.config/gnupg"
export ZDOTDIR=~/.config/zsh
export ZLOCALDIR=~/.local/share/zsh
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LIBSEAT_BACKEND=logind

source $ZDOTDIR/zsh-exports
source "$CARGO_HOME/env"

XCURSOR_THEME=bibata
XCURSOR_SIZE=32

