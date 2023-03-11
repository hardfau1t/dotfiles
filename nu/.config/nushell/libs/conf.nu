# Edit neovim configurations
export def "config nvim" [] {
    cd ~/.dots/neovim/.config/nvim/
    nvim init.lua
}
# Edit alacritty.yml
export def "config alacritty" [] {
    nvim ~/.dots/alacritty/.config/alacritty/alacritty.yml
}

# Edit hyprland config
export def "config hypr" [] {
    cd ~/.dots/hypr/.config/hypr/
    nvim hyprland.conf
}

# Edit sway config
export def "config sway" [] {
    cd ~/.dots/sway/.config/sway/
    nvim config
}

# Edit eww config
export def "config eww" [] {
    cd ~/.config/eww/
    nvim eww.yuck
}
export def "config emoji" [] {
    nvim (which emoji.sh).path
}
export def "config zellij" [] {
    cd ~/.config/zellij
    nvim config.kdl
}
