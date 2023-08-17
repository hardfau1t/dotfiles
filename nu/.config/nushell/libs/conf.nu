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
export def "config starship" [] {
    nvim ~/.config/starship.toml
}
export def "config zellij" [] {
    cd ~/.config/zellij
    nvim config.kdl
}
export def "config push" [] {
    cd $"($env.HOME)/.dots"
    let current_branch = (git branch | rg -e '\*' | split row ' ').1
    git stash
    git checkout main
    git pull
    git rev-list $"main..($current_branch)" | lines | drop 1 | git cherry-pick $in
    git push
    git switch -
    git rebase main
    git stash pop
}

export def "config pull" [] {
    cd $"($env.HOME)/.dots"
    git stash
    git checkout main
    git pull
    git switch -
    git rebase main
    git stash pop
}

export def "config libs" [] {
    cd ~/.dots/nu/.config/nushell/libs/
    nvim basics.nu
}
