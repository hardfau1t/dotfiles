return {
    "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
    end,
    dependencies = {
        "benfowler/telescope-luasnip.nvim",
        "rafamadriz/friendly-snippets"
    }
}
