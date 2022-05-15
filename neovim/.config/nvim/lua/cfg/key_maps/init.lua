local avail, wk = pcall(require, "which-key")

if not avail then
	print("which key is required")
	return
end

-- setting for leader key
vim.keymap.set('n', '<Space>', '<NOP>')

-- no highlight
vim.keymap.set('n', '<F3>', ':set hlsearch!<CR>')

-- redo remap
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<C-r>', '<NOP>')

-----------------window management------------------------
-- window movement
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
-- terminal mode movement
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:wincmd l<CR>')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>')
-- window resize
vim.keymap.set('n', '<C-w>>', '<C-w>><C-w>', {silent = true})
vim.keymap.set('n', '<C-w><', '<C-w><<C-w>', {silent = true})
vim.keymap.set('n', '<C-w>+', '<C-w>+<C-w>', {silent = true})
vim.keymap.set('n', '<C-w>-', '<C-w>-<C-w>', {silent = true})

vim.keymap.set('n', '<C-w><CR>', '<NOP>', {silent = true})


-- shifting in visual mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- copy content to system buffer in visual mode as well as 
vim.keymap.set('v', 'y', '"+ygvy')


wk.register({
---------------------Packer------------------------------
    p ={
        name = "packer",
        i = {  ':PackerInstall<CR>', "Install"},
        u = {  ':PackerUpdate<CR>', "Update"},
        s = {  ':PackerSync<CR>', "Sync all"},
        S = {  ':PackerStatus<CR>', "status"},
        c = {  ':PackerCompile<CR>', "compile"},
        r = {  ':PackerClean<CR>', "clean/remove"},
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
    },
------------------------------------ Buffer management------------------------
    b = {
        name = "BufferManagement",
        n = { ':bnext<CR>', "Next"},
        p = { ':bprevious<CR>', "Prev"},
    }
}, {prefix = "<leader>"})

