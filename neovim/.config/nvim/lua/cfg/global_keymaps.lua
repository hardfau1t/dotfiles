-- setting for leader key
vim.keymap.set("n", "<Space>", "<NOP>")

-- no highlight
vim.keymap.set("n", "<F3>", ":set hlsearch!<CR>")

-- redo remap
vim.keymap.set("n", "U", "<C-r>", { silent = true })
vim.keymap.set("n", "<C-r>", "<NOP>", { silent = true })
vim.keymap.set("i", "<C-o>", "<NOP>", { silent = true })
-- vim.keymap.set("n", "<C-w>>", "<NOP>", { silent = true})

-----------------window management------------------------
-- window movement
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
-- terminal mode movement
vim.keymap.set("t", "<C-h>", "<C-\\><C-n>:wincmd h<CR>", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n>:wincmd l<CR>", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n>:wincmd j<CR>", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n>:wincmd k<CR>", { silent = true })
-- window resize
vim.keymap.set("n", "<C-w>>", "<C-w>><C-w>", { silent = true})
vim.keymap.set("n", "<C-w><", "<C-w><<C-w>", { silent = true})
vim.keymap.set("n", "<C-w>+", "<C-w>+<C-w>", { silent = true})
vim.keymap.set("n", "<C-w>-", "<C-w>-<C-w>", { silent = true})
vim.keymap.set("n", "<C-w><CR>", "<NOP>", { silent = true })

-- buffer management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true , desc = "next buffer"})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true, desc = "previous buffer"})
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { silent = true, desc = "flush current buffer"})
vim.keymap.set("n", "<leader>bc", clean_buf, { silent = true, desc = "remove all non opened buffers(which are not on any window)"})

-- shifting in visual mode
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })

-- copy content to system buffer in visual mode as well as
vim.keymap.set("v", "y", '"+ygvy', { silent = true })
vim.keymap.set("v", "P", '"_dP', { silent = true })


vim.keymap.set("n", "<leader>st", ":source %<CR>", { silent = true })
