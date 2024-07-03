local setup = function()
    vim.g.completeopt = "menu,menuone,noselect"
    local ls = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    cmp.setup({
        snippet = {
            expand = function(args)
                ls.lsp_expand(args.body)
            end,
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
            ["<C-j>"] = cmp.mapping.scroll_docs(4),
            ["<C-k>"] = cmp.mapping.scroll_docs(-4),
            ["<C-s>"] = cmp.mapping(function(fallback)
                if ls.expandable() then
                    ls.expand()
                elseif cmp.visible() then
                    cmp.confirm()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-e>"] = cmp.mapping(function(fallback)
                if ls.jumpable(1) then
                    ls.jump(1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-o>"] = cmp.mapping(function(fallback)
                if ls.jumpable(-1) then
                    ls.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-n>"] = cmp.mapping(
                function(fallback) -- if completion available go to next,else if snippets available next item
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end
            ),
            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end),
            ["<C-c>"] = cmp.mapping.close(),
        }),

        sources = cmp.config.sources({
            { name = "nvim_lsp", max_item_count = 4 },
            { name = "lazydev", group_index = 0}, -- this from lazy_dev plugin and provides vim completion
            { name = "luasnip",  max_item_count = 4 },
            { name = "nvim_lua" },
            { name = "neorg" },
            { name = "git" },
            { name = "path" },
            { name = "buffer",   keyword_length = 4 },
        }),
        formatting = {
            format = lspkind.cmp_format(),
        },
        experimental = {
            native_menu = false,
            ghost_text = false,
        },
    })
end

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind-nvim",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "onsails/lspkind-nvim",
        "petertriho/cmp-git",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        setup()
    end,
}
