export def "trial nvim" [
    ...args
] {
    XDG_CONFIG_HOME=~/.config/home-manager/configs nvim -u ~/.config/home-manager/configs/nvim/init.lua ...$args
}

export def "trial waybar" [
    ...args
] {
    waybar -c ~/.config/home-manager/configs/waybar/config -s ~/.config/home-manager/configs/waybar/style.css ...$args
}
