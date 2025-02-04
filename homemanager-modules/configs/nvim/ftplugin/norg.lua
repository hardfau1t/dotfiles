vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.listchars = ""
vim.opt.spell = true

vim.keymap.set("n", "<localleader>jj", ":Neorg journal today<CR>", { buffer = true, desc = "journal today" })
vim.keymap.set("n", "<localleader>jy", ":Neorg journal yesterday<CR>", { buffer = true, desc = "journal yesterday" })
vim.keymap.set("n", "<localleader>jt", ":Neorg journal tomorrow<CR>", { buffer = true, desc = "journal tomorrow" })
vim.keymap.set("n", "<localleader>jc", ":Neorg journal custom<CR>", { buffer = true, desc = "journal custom date" })
vim.keymap.set("n", "<localleader>ju", ":Neorg journal toc update<CR>", { buffer = true, desc = "journal toc udate" })
vim.keymap.set("n", "<localleader>jo", ":Neorg journal toc open<CR>", { buffer = true, desc = "journal toc" })
vim.keymap.set("n", "<localleader>os", ":Neorg toc split<CR>", { buffer = true, desc = "toc open in split" })
vim.keymap.set("n", "<localleader>oc", ":Neorg toc close<CR>", { buffer = true, desc = "toc close" })
vim.keymap.set("n", "<localleader>oq", ":Neorg toc toqflist<CR>", { buffer = true, desc = "toc quickfix list" })
vim.keymap.set("n", "<localleader>sh", "<Plug>(neorg.telescope.search_headings)",
    { buffer = true, desc = "search headings" })
vim.keymap.set({ "i", "n" }, "<localleader>sl", "<Plug>(neorg.telescope.insert_link)",
    { buffer = true, desc = "insert link" })

local wk_available, wk = pcall(require, 'which-key')
if wk_available then
    wk.add({
        { "<localleader>j", group = "journal" },
        { "<localleader>o", group = "table of content" },
        { "<localleader>c", group = "code lense" },
        { "<localleader>l", group = "manage list" },
        { "<localleader>s", group = "telescope" },
        { "<localleader>i", group = "insert things" },
        { "<localleader>n", group = "neorg new" },
        { "<localleader>t", group = "manage task" },
    })
end
