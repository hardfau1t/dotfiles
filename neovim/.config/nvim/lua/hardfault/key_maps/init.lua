local opts = { noremap=true, silent=true }

-- setting for leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', opts)

-- no highlight
vim.api.nvim_set_keymap('n', '<F3>', ':set hlsearch!<CR>', opts)

-- redo remap
vim.api.nvim_set_keymap('n', 'U', '<C-r>', opts)
vim.api.nvim_set_keymap('n', '<C-r>', '<NOP>', opts)

-- replace content in visual mode
vim.api.nvim_set_keymap('v', '<leader>P', '_dP', opts)


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


---------------------Packer------------------------------
vim.api.nvim_set_keymap('n', '<leader>pi', ':PackerInstall<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>pu', ':PackerUpdate<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>pS', ':PackerStatus<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>pc', ':PackerCompile<CR>', {silent = true})

-- shifting in visual mode
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- copy content to system buffer in visual mode as well as 
vim.api.nvim_set_keymap('v', 'y', '"+ygvy', opts)

----------------------terminal--------------------------
-- exit right away
vim.api.nvim_set_keymap('t', '<C-d>', '<C-\\><C-n>:wincmd q<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>xt', ':terminal<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>xv', '<C-w>v:terminal<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>xs', '<C-w>s:terminal<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-Space>', '<C-\\><C-n>', opts)


----------------------------------------cscope--------------------------------------------------
-- assignments to this symbol
vim.api.nvim_set_keymap('n', '<leader>sh', ':cscope help<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sa', ':cscope find a <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sc', ':cscope find c <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sd', ':cscope find d <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>se', ':cscope find e <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sf', ':cscope find f <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sg', ':cscope find g <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>si', ':cscope find i <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ss', ':cscope find s <cword><CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>st', ':cscope find t <cword><CR>', opts)

