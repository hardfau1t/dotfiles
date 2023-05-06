export def "sinks" [ ] {
    pactl --format=json list sinks | from json | select index name description
}

export def "sources" [ ] {
    pactl --format=json list sources | from json | select index name description
}

export def "source" [] {
    pactl get-default-source
    pactl get-source-volume @DEFAULT_SOURCE@
}
export def "sink" [] {
    pactl get-default-sink
    pactl get-source-volume @DEFAULT_SOURCE@
}
