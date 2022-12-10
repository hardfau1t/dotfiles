vim.g.mapleader = " "
vim.g.rust_recommended_style = 0
vim.g.netrw_winsize = 10
-- show tabs and spaces
vim.o.list = true
vim.o.listchars = "tab:> ,trail:●,extends:…,precedes:…"
vim.o.sidescrolloff = 20

vim.bo.autoindent = true -- use treesitter indentation
vim.bo.smartindent = true

vim.wo.cursorline = true
vim.wo.cursorcolumn = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.foldmethod = "expr"
vim.o.foldminlines = 5
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.scrolloff = 10
vim.o.textwidth = 0
vim.o.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.o.inccommand = "nosplit"
vim.o.timeoutlen = 1000
vim.o.updatetime = 200 -- cursor hold
vim.o.clipboard = "unnamed"
vim.o.linebreak = false
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.incsearch = true
vim.o.undofile = true
vim.o.showmatch = true
vim.o.showcmd = true
vim.o.autowrite = true
vim.o.autoread = true
vim.o.ttyfast = true
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.o.hlsearch = true
vim.o.signcolumn = "number"
vim.o.numberwidth = 4

vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

-- vim.cmd("syntax on")                     -- if enabled treesitter fails to start
vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd("WinEnter", {
    desc = "set cursorline on bufenter",
    callback = function()
        vim.wo.cursorline = true
        vim.wo.cursorcolumn = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    desc = "set cursorline on bufenter",
    callback = function()
        vim.wo.cursorline = false
        vim.wo.cursorcolumn = false
    end,
})
