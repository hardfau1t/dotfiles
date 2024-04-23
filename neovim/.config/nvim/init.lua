
local mods = {
    "cfg",
    "cfg.utils",
    "cfg.global_keymaps",
    "cfg.rocks",
    "cfg.treesitter",
    "cfg.catppuccin",
    "cfg.lua_line",
    "cfg.oil",
    "cfg.nvim-autopairs",
    "cfg.luasnip",
    "cfg.telescope",
    "cfg.neorg",
    "cfg.lsp",
    "cfg.nvim-cmp",
    "cfg.which-key",
    "cfg.indent_blankline",
    "cfg.comment_nvim",
    "cfg.trouble",
    "cfg.text-case",
    "cfg.gitsigns",
    "cfg.fidget",
    "cfg.neogen",
    "cfg.neogit",
    "cfg.surround",
}

for _, mod in ipairs(mods) do
    require(mod)
end
vim.cmd([[colorscheme catppuccin-macchiato]])
