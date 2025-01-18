#!/usr/bin/env bash

which rg >/dev/null 2>&1 || { echo missing rg; exit 1; }
which fuzzel >/dev/null 2>&1 || { echo missing fuzzel; exit 1; }

shortcut=`                                              \
    rg "(bindsym|bindcode)" ~/.config/sway/config   |   \
        # remove all the comments
    rg -v "^\s*#"                                   |   \
        # remove all white spaces in the beginning
    sed 's/^\s*//'                                  |   \
        # strip bindsym/code and white spaces then multiple optional  flags (--locked)
    sed 's/^bind\(sym\|code\)\s*\(-\+\w*\s*\)*//'  |   \
    fuzzel -d
    `
cmd="`echo "$shortcut" | sed 's/^\S*\s*//'`"
swaymsg $cmd

