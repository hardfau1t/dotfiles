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
                extensions = {"math"}
                }
            },
            ["core.gtd.base"] = {
                config = {
                    workspace = "my_workspace",
                    inbox = "inbox.norg",
                    displayers = {
                        projects = {
                            show_completed_projects = false,
                            show_projects_without_tasks = false,
                        },
                    },
                    --[[ exclude = {
                        "notes",
                        "references",
                    }, ]]
                },
            },
            ["core.integrations.telescope"] = {},
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
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
                    engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
                },
            },
            ["core.keybinds"] = {
                config = { -- Note that this table is optional and doesn't need to be provided
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
