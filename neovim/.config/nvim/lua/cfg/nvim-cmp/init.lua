local mod = {}

mod.setup = function()
    vim.g.completeopt = "menu,menuone,noselect"
    local status, ls, cmp, lspkind
    status, ls = pcall(require, "luasnip")
    if not status then
        print("luasnip is not installed")
        return
    end
    status, cmp = pcall(require, "cmp")
    if not status then
        print("nvim-cmp is not installed")
        return
    end
    status, lspkind = pcall(require, "lspkind")
    if not status then
        print("lspkind is not installed")
        return
    end
    cmp.setup({
        snippet = {
            expand = function(args)
                ls.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-j>"] = cmp.mapping.scroll_docs(4),
            ["<C-k>"] = cmp.mapping.scroll_docs(-4),
            ["<C-s>"] = cmp.mapping(function(fallback)
                if not ls.expand_or_jump() then
                    fallback()
                end
            end),
            ["<C-o>"] = cmp.mapping(function(fallback)
                if ls.jumpable(-1) then
                    ls.jump(-1)
                else
                    fallback()
                end
            end),
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
            { name = "luasnip", max_item_count = 4 },
            { name = "nvim_lsp", max_item_count = 8 },
            { name = "nvim_lua" },
            { name = "neorg" },
            { name = "git" },
            { name = "path" },
            { name = "buffer", keyword_length = 4 },
        }),
        formatting = {
            format = lspkind.cmp_format(),
        },
        experimental = {
            native_menu = false,
            ghost_text = true,
        },
    })
end

return mod
