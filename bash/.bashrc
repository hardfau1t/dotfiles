set -o vi
alias cat=bat
alias v=/usr/bin/nvim
alias fm=vifm
alias gdb='gdb -q'
alias arm-none-eabi-gdb='arm-none-eabi-gdb -q'
alias sway="sway > /var/log/sway.log 2>&1"
alias se=sudoedit
alias mp_stat='mpc sticker "`mpc current -f "%file%"`" list'
alias mka=mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/average/
alias mkb=mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/bhakti_geethe/
alias mkt=mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/top/
alias mko=mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/og/
alias cfg='/usr/bin/git --git-dir=/home/gireesh/playground/gits/dotfiles --work-tree=/home/gireesh '
alias ls='ls --color'

export EDITOR=/usr/local/bin/nvim
export SYSTEMD_EDITOR=/usr/local/bin/nvim
export LANG=en_IN.UTF-8
export LC_CTYPE=en_IN.UTF-8
export CHEAT_CONFIG_PATH="~/.config/cheat/conf.yml"
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_LIB_DIR="/home/gireesh/.local/share/lib"

eval "$(starship init bash)"
