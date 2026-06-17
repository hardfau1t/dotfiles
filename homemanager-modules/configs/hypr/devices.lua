hl.config({
    input = {
        follow_mouse = 2,
        float_switch_override_focus = 0,
        resolve_binds_by_sym = true,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.device({ name = "at-translated-set-2-keyboard", kb_layout = "cust" })
hl.device({ name = "foostan-corne-keyboard", kb_layout = "us" })
hl.device({ name = "foostan-corne-consumer-control", kb_layout = "us" })
hl.device({ name = "foostan-corne-system-control", kb_layout = "us" })
hl.device({ name = "foostan-corne", kb_layout = "us" })