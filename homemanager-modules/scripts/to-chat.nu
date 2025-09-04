open sys.json
| into value
| insert time {|row|
    ($row.timestamp | into int) / 1000
    | into int
    | into datetime -f '%s'
}
| insert conf {|row|
    if $row.key_from_me == 1 {
        {"prefix": '>', "color": "xterm_blue"}
    } else {
        {"prefix": '<', "color": "xterm_yellow"}
    }
}
| insert formatted_time {|row| $row.time | format date  '%I:%M:%S %p' | str downcase }
| group-by {|row| $row.time | format date '%A %e-%B-%Y'} --to-table
| each {|date|
    [
        ($"\n                   (ansi light_gray_bold)($date.group)(ansi reset)"),
        ($date.items 
            | each {|row|
                $"(ansi xterm_grey)($row._id)(ansi reset) [($row.formatted_time)] ($row.conf.prefix) (ansi $row.conf.color)($row.data)(ansi reset)" 
            }
        )
    ]
}
| flatten | to text | save -f sys.chat
