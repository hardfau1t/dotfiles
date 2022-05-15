local mod = {}

mod.set_keymaps = function(kb)
    -- remaps all the non leader keys
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
    kb.map("norg", "n", kb.leader .. "cs", ":Neorg toc split<CR>")
    kb.map("norg", "n", kb.leader .. "cc", ":Neorg toc close<CR>")
    kb.map("norg", "n", kb.leader .. "cq", ":Neorg toc toqflist<CR>")
end

vim.keymap.set("n", "\\", "<nop>")
vim.keymap.set("n", "\\\\", ":NeorgStart<CR>")
return mod
