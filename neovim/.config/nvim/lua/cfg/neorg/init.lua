local mod = {}
function mod.init()
  local opts = {
      load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {
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
                      }
                  }
              }
          }, -- Allows for use of icons
          ["core.export"] = {},
          ["core.export.markdown"] = {
              config = {
                  extensions = { "todo-items-basic", "todo-items-pending", "todo-items-extended", "definition-lists", "mathematics" }
              }
          },
          ["core.integrations.telescope"] = {},
          ["core.norg.dirman"] = {
              config = {
                  workspaces = {
                      my_workspace = "~/.local/share/notes/",
                  },
                  default_workspace = "my_workspace",
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
