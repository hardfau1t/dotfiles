export def "trial nvim" [
    ...args
] {
    XDG_CONFIG_HOME=~/.config/home-manager/configs nvim -u ~/.config/home-manager/configs/nvim/init.lua ...$args
}
