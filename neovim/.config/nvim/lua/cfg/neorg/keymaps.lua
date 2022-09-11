local mod = {}

mod.set_keymaps = function(kb)
    -- remaps all the non leader keys
    kb.remap_key("norg", "n",  kb.leader.."tc", kb.leader.."c" )
    kb.remap_key("norg", "n",  kb.leader.."tv", kb.leader.."v" )
    kb.remap_key("norg", "n",  kb.leader.."te", kb.leader.."e" )
    kb.remap_key("norg", "n",  kb.leader.."nn", kb.leader.."n" )
    kb.remap_key("norg", "n",  "gtu", kb.leader.."tu" )
    kb.remap_key("norg", "n",  "gtp", kb.leader.."tp" )
    kb.remap_key("norg", "n",  "gtd", kb.leader.."td" )
    kb.remap_key("norg", "n",  "gth", kb.leader.."th" )
    kb.remap_key("norg", "n",  "gtc", kb.leader.."tc" )
    kb.remap_key("norg", "n",  "gtr", kb.leader.."tr" )
    kb.remap_key("norg", "n",  "gti", kb.leader.."ti" )
    -- journal shortcuts
    kb.map("norg", "n", kb.leader .. "jt", ":Neorg journal today<CR>")
    kb.map("norg", "n", kb.leader .. "jy", ":Neorg journal yesterday<CR>")
    kb.map("norg", "n", kb.leader .. "jm", ":Neorg journal tomorrow<CR>")
    -- Table of content
    kb.map("norg", "n", kb.leader .. "os", ":Neorg toc split<CR>")
    kb.map("norg", "n", kb.leader .. "oc", ":Neorg toc close<CR>")
    kb.map("norg", "n", kb.leader .. "oq", ":Neorg toc toqflist<CR>")
    -- kb.map_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
end

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
vim.keymap.set("n", "\\", "<nop>")
vim.keymap.set("n", "\\\\", ":NeorgStart<CR>")
return mod
