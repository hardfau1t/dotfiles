#!/usr/bin/env nu

let status = if (dunstctl is-paused | into bool ) { "" } else { ""}

let output_val = {"text": $status} | to json -r

print $output_val

