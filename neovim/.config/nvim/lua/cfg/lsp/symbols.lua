local mod = {}
mod.setup = function()
    require("symbols-outline").setup({
        autofold_depth = 3,
        width =  15,
    })
    vim.keymap.set("n", "<leader>;", ":SymbolsOutline<CR>")
end

return mod
