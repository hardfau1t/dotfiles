vim.g.mapleader = ' '
vim.g.netrw_winsize = 10

vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4

vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.number = true
vim.o.foldmethod="indent"
vim.o.foldnestmax=2
vim.o.scrolloff=10
vim.o.textwidth=0
vim.o.undodir="/home/gireesh/.local/share/nvim/undodir"
vim.o.inccommand="nosplit"
vim.o.timeoutlen=4000
vim.o.updatetime=1500
vim.o.clipboard="unnamed"
vim.o.statusline="%{FugitiveStatusline()}"
vim.o.linebreak  = false
vim.o.wrap = false
vim.o.foldenable = false
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
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hlsearch = true
vim.o.signcolumn = "number"
vim.o.numberwidth = 3

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- colorscheme
vim.g.gruvbox_contrast_dark="hard"
vim.g.gruvbox_transparent_bg=0
vim.cmd("colorscheme gruvbox")

