return {
    "nickjvandyke/opencode.nvim",
    enabled = false,
    dependencies = {
        {
            -- `snacks.nvim` integration is recommended, but optional
            ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
            "folke/snacks.nvim",
            optional = true,
            opts = {
                input = {}, -- Enhances `ask()`
                picker = { -- Enhances `select()`
                    actions = {
                        opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
                    },
                    win = {
                        input = {
                            keys = {
                                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                            },
                        },
                    },
                },
            },
        },
    },
    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            server = { port = 4096, },
        }

        vim.o.autoread = true -- Required for `opts.events.reload`

        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<leader>cc", function() require("opencode").ask("@this: ") end,
            { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<leader>cs", function() require("opencode").select() end,
            { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<leader>c<leader>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

        -- vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
        --     { desc = "Add range to opencode", expr = true })
        -- vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
        --     { desc = "Add line to opencode", expr = true })

        vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
            { desc = "Scroll opencode up" })
        vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
            { desc = "Scroll opencode down" })

    end,
}
