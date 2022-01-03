local mod = {}

function mod.setup()
    require'nvim-tree'.setup()
    -- keymaps
    require("cfg.nvim-tree.keymaps")
end

return mod
