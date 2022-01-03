local mod = {}

function mod.setup()
	vim.g.comfortable_motion_scroll_down_key = "j"
	vim.g.comfortable_motion_scroll_up_key = "k"
	vim.g.comfortable_motion_friction = 80.0
	vim.g.comfortable_motion_air_drag = 2.0
    require("cfg.comfortable-motion.keymaps")
end

return mod
