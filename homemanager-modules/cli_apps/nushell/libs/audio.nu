# lists all pulse sinks in json format
export def plsi [] { pactl --format=json list sinks | from json}
# lists all pulse sources in json format
export def plso [] {pactl --format=json list sources | from json}
# lists all pulse moudles in json format
export def plmo [] {pactl --format=json list modules | from json}
