
NEORG_DIR =  vim.fn.expand("~/.local/share/notes/")


local function setup_auto_commands()
    local neorg_journal_template_handler = vim.api.nvim_create_augroup("NeorgJournalTemplate", {})
    vim.api.nvim_create_autocmd("BufNewFile", {
        group = neorg_journal_template_handler,
        command = "Neorg templates load journal ",
        -- since this autocammand is only setup if the neorg workspace is initialized no need to check for valid path
        pattern = { "*journal/*.norg" },
        desc = "Create journal template on creation"
    })
end
do
    local opts = {
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.concealer"] = {
                config = {
                    icon_preset = "diamond",
                    icons = {
                        heading = {
                            level_1 = { icon = "❖" },
                            level_2 = { icon = "◈" },
                            level_3 = { icon = "⟡" },
                            level_4 = { icon = "◇" },
                            level_5 = { icon = "◆" },
                            level_6 = { icon = "⋄" },
                        },
                        code_block = {
                            width = "content"
                        }
                    }
                }
            }, -- Allows for use of icons
            ["core.export"] = {},
            ["core.ui.calendar"] = {},
            ["core.export.markdown"] = {
                config = {
                    extensions = { "todo-items-basic", "todo-items-pending", "todo-items-extended", "definition-lists",
                        "mathematics" }
                }
            },
            ["core.integrations.telescope"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        my_workspace = NEORG_DIR,
                    },
                    default_workspace = "my_workspace",
                },
            },
            ["core.completion"] = {
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
            ["external.templates"] = {
                config = {
                    templates_dir = vim.fn.stdpath("config") .. "/lua/cfg/neorg/templates",
                    snippets_overwrite = {
                        date_format = [[%Y/%m/%d]],
                    }

                }
            }
        },
    }
    setup_auto_commands()
    require("neorg").setup(opts)
end

