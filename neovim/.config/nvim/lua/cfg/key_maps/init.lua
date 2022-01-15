local avail, wk = pcall(require, "which-key")

if not avail then
	print("which key is required")
	return
end
local opts = { noremap=true, silent=true }

-- setting for leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', opts)

-- no highlight
vim.api.nvim_set_keymap('n', '<F3>', ':set hlsearch!<CR>', opts)

-- redo remap
vim.api.nvim_set_keymap('n', 'U', '<C-r>', opts)
vim.api.nvim_set_keymap('n', '<C-r>', '<NOP>', opts)

-----------------window management------------------------
-- window movement
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', opts)
-- terminal mode movement
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n>:wincmd l<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>', opts)
-- window resize
vim.api.nvim_set_keymap('n', '<C-w>>', '<C-w>><C-w>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-w><', '<C-w><<C-w>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-w>+', '<C-w>+<C-w>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-w>-', '<C-w>-<C-w>', {silent = true})

vim.api.nvim_set_keymap('n', '<C-w><CR>', '<NOP>', {silent = true})


-- shifting in visual mode
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- copy content to system buffer in visual mode as well as 
vim.api.nvim_set_keymap('v', 'y', '"+ygvy', opts)


wk.register({
---------------------Packer------------------------------
    p ={
        name = "packer",
        i = {  ':PackerInstall<CR>', "Install"},
        u = {  ':PackerUpdate<CR>', "Update"},
        s = {  ':PackerSync<CR>', "Sync all"},
        S = {  ':PackerStatus<CR>', "status"},
        c = {  ':PackerCompile<CR>', "compile"},
    },
----------------------------------------cscope--------------------------------------------------
    s = {
        h = { ':cscope help<CR>'},
        a = { ':cscope find a <cword><CR>', "assignments to this symbol"},
        c = { ':cscope find c <cword><CR>', "functions calling this function"},
        d = { ':cscope find d <cword><CR>', "functions called by this function"},
        e = { ':cscope find e <cword><CR>', "egrep pattern"},
        f = { ':cscope find f <cword><CR>', "Find this file"},
        g = { ':cscope find g <cword><CR>', "definition"},
        i = { ':cscope find i <cword><CR>', "files #including this file"},
        s = { ':cscope find s <cword><CR>', "Find C symbol"},
        t = { ':cscope find t <cword><CR>', "Find text string"},
    }
}, {prefix = "<leader>"})

