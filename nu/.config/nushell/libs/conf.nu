# Edit neovim configurations
export def "config nvim" [] {
    cd ~/.config/nvim/
    nvim init.lua
}
# Edit alacritty.yml
export def "config alacritty" [] {
    nvim ~/.config/alacritty/alacritty.yml
}

# Edit hyprland config
export def "config hypr" [] {
    cd ~/.config/hypr/
    nvim hyprland.conf
}

# Edit sway config
export def "config sway" [] {
    cd ~/.config/sway/
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
export def "config starship" [] {
    nvim ~/.config/starship.toml
}

export def "config mpv" [] {
    cd ~/.config/mpv
    nvim mpv.conf
}

export def "config zellij" [] {
    cd ~/.config/zellij
    nvim config.kdl
}
export def "config push" [] {
    cd $"($env.HOME)/.dots"
    # disable autoreloading in hyprland
    if not ($env | get HYPRLAND_INSTANCE_SIGNATURE -i| is-empty) {
        hyprctl keyword misc:disable_autoreload "true" | ignore
    }
    let current_branch = (git branch | rg -e '\*' | split row ' ').1
    git stash
    git checkout main
    git pull
    git rev-list $"main..($current_branch)" | lines | drop 1 | git cherry-pick $in
    git push
    git switch -
    git rebase main
    git stash pop
    # enable autoreloading in hyprland
    if not ($env | get HYPRLAND_INSTANCE_SIGNATURE -i| is-empty) {
        hyprctl keyword misc:disable_autoreload "false" | ignore
    }
}

export def "config pull" [] {
    cd $"($env.HOME)/.dots"
    # disable autoreloading in hyprland
    if not ($env | get HYPRLAND_INSTANCE_SIGNATURE -i| is-empty) {
        hyprctl keyword misc:disable_autoreload "true" | ignore
    }
    git stash
    git checkout main
    git pull
    git switch -
    git rebase main
    git stash pop
    # enable autoreloading in hyprland
    if not ($env | get HYPRLAND_INSTANCE_SIGNATURE -i| is-empty) {
        hyprctl keyword misc:disable_autoreload "false" | ignore
    }
}

export def "config libs" [] {
    cd ~/.config/nushell/libs/
    nvim basics.nu
}

export def "config bat" [] {
    cd ~/.config/bat/
    nvim ~/.config/bat/config
}
