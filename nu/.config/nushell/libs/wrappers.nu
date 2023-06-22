
alias actual-aws = aws
alias actual-hyprctl = hyprctl
alias actual-pactl = pactl
alias actual-resolvectl = resolvectl

export extern aws [...params: any] {
    try {
       actual-aws $params | from json
    } catch {
       actual-aws $params
    }
}

export extern hyprctl [...params: any] {
    try {
       actual-hyprctl -j $params | from json
    } catch {
       actual-hyprctl $params
    }
}

export extern pactl [...params] {
    try {
        actual-pactl --format=json $params | from json
    } catch {
        actual-pactl $params
    }
}

export extern resolvectl [...params] {
    try {
       actual-resolvectl --json=short $params | from json
    } catch {
       actual-resolvectl $params
    }
}
