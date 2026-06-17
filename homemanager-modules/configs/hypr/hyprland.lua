local theme = require("themes/catppuccin-machiato")
require("shortcuts")
require("init")
require("private")
require("style")
require("workspace")
require("devices")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 6,
        border_size = 2,
        resize_on_border = true,
        col = {
            active_border = theme.sky,
            inactive_border = theme.overlay0,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_autoreload = false,
        disable_splash_rendering = true,
    },
    dwindle = {
        preserve_split = true,
        force_split = 2,
    },
    cursor = {
        hide_on_key_press = true,
    },
})