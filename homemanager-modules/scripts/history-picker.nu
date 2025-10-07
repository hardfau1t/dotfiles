#!/usr/bin/env nu
let history = cliphist list | parse -r '(?<id>\d+)\s*(?<text>.*)'
try {
    # if the user hits escape or some error happens then do not overrite the clipboard
    let index = $history.text | to text | fuzzel -d --index | into int
    $history | get -o $index | default $history.0 | get id | cliphist decode | wl-copy
} catch {|err|
    notify-send "clipboard" $"couldn't copy the content to clipboard: ($err.msg)"
}

