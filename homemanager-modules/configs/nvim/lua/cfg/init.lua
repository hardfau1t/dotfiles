vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.rust_recommended_style = 0
vim.g.netrw_winsize = 10
-- show tabs and spaces
vim.o.list = true
vim.o.listchars = "tab:> ,trail:●,extends:…,precedes:…"
vim.o.sidescrolloff = 20
vim.o.mouse = ""

vim.bo.autoindent = true -- use treesitter indentation
vim.bo.smartindent = true

vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.conceallevel = 2
vim.wo.foldminlines = 4
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldtext = ""
vim.wo.foldenable = false

vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.scrolloff = 10
vim.o.textwidth = 0
vim.o.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.o.inccommand = "nosplit"
vim.o.timeout = true
vim.o.timeoutlen = 1000
vim.o.updatetime = 200 -- cursor hold
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
vim.o.signcolumn = "yes:1"
vim.o.numberwidth = 4

vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
-- vim.opt.fillchars = {
--     fold = " ",
-- }
vim.g.c_syntax_for_h = true
vim.g.loaded_netrw       = 1 -- for nvim-tree
vim.g.loaded_netrwPlugin = 1 -- for nvim-tree
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}


vim.cmd("syntax on")                     -- if enabled treesitter fails to start
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

