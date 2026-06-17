hl.config({
    decoration = {
        rounding = 3,
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            xray = true,
        },
        dim_inactive = false,
        dim_strength = 0.2,
    },
})

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })