local mod = {}
function mod.init()

    local opts = {
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.qol.toc"] = {},
            ["core.norg.journal"] = {},
            ["core.export"] = {},
            ["core.export.markdown"] = {
                config = {
                extensions = {"todo-items-basic", "todo-items-pending", "todo-items-extended", "definition-lists", "mathematics" }
                }
            },
            ["core.integrations.telescope"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        my_workspace = "~/.local/share/personal_space",
                    },
                },
            },
            ["core.integrations.nvim-cmp"] = {
                config = {
                },
            },
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.keybinds"] = {
                config = {
                    default_keybinds = true,
                    neorg_leader = "\\",
                    hook = require("cfg.neorg.keymaps").set_keymaps,
                },
            },
        },
    }

    require("neorg").setup(opts)
end

return mod
