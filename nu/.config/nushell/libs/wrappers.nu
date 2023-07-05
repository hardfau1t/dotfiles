
alias actual-aws = aws
alias actual-hyprctl = hyprctl
alias actual-pactl = pactl
alias actual-resolvectl = resolvectl
alias actual-ip = ip

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

export extern resolvectl [...params] {
    try {
       actual-resolvectl --json=short $params | from json
    } catch {
       actual-resolvectl $params
    }
}

export extern ip [...params] {
    try {
       actual-ip -j $params | from json
    } catch {
       actual-ip $params
    }
}
