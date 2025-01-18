#vim:syntax=sh
abbr -a cat bat
abbr -a v /usr/bin/nvim
abbr -a fm vifm
abbr -a gdb 'gdb -q'
abbr -a arm-none-eabi-gdb 'arm-none-eabi-gdb -q'
abbr -a sway "sway > /var/log/sway.log 2>&1"
abbr -a se sudoedit
abbr -a mp_stat 'mpc sticker "`mpc current -f "%file%"`" list'
abbr -a -U -- mka mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/average/
abbr -a -U -- mkb mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/bhakti_geethe/
abbr -a -U -- mkt mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/top/
abbr -a -U -- mko mv\ \~/storage/music/\(mpc\ current\ -f\ \'\%file\%\'\)\ /home/gireesh/storage/music/kannada/og/

function cfg 
    command /usr/bin/git --git-dir=/home/gireesh/playground/gits/dotfiles --work-tree=/home/gireesh $argv
end

set -gx EDITOR /usr/local/bin/nvim
set -gx SYSTEMD_EDITOR /usr/local/bin/nvim
set -gx LANG en_IN.UTF-8
set -gx LC_CTYPE en_IN.UTF-8
set -gx CHEAT_CONFIG_PATH "~/.config/cheat/conf.yml"
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx XDG_LIB_DIR "/home/gireesh/.local/share/lib"
# set -gx ARCH arm
# set -gx CROSS_COMPILE arm-none-eabi-

set fish_greeting
fish_vi_key_bindings
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

starship init fish | source
