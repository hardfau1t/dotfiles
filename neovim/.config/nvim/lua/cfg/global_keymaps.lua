-- setting for leader key
vim.keymap.set("n", "<Space>", "<NOP>")

-- no highlight
vim.keymap.set("n", "<F3>", ":set hlsearch!<CR>")

-- redo remap
vim.keymap.set("n", "U", "<C-r>", { silent = true })
vim.keymap.set("n", "<C-r>", "<NOP>", { silent = true })

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
vim.keymap.set("n", "<C-w>>", "<C-w>><C-w>", { silent = true, remap = true })
vim.keymap.set("n", "<C-w><", "<C-w><<C-w>", { silent = true, remap = true })
vim.keymap.set("n", "<C-w>+", "<C-w>+<C-w>", { silent = true, remap = true })
vim.keymap.set("n", "<C-w>-", "<C-w>-<C-w>", { silent = true, remap = true })
vim.keymap.set("n", "<C-w><CR>", "<NOP>", { silent = true })

-- buffer management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", clean_buf, { silent = true })

-- shifting in visual mode
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })

-- copy content to system buffer in visual mode as well as
vim.keymap.set("v", "y", '"+ygvy', { silent = true })
vim.keymap.set("v", "P", '"_dP', { silent = true })


local sync_all = function()
    local found, pc = pcall(require, "packer")
    if not found then
        print("packer not found")
        return
    end
    pc.clean()
    pc.update()
    vim.api.nvim_command("TSUpdate")

end

---------------------Packer------------------------------
vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>", { silent = true })
vim.keymap.set("n", "<leader>pu", ":PackerUpdate<CR>", { silent = true })
vim.keymap.set("n", "<leader>ps", sync_all, { silent = true })
vim.keymap.set("n", "<leader>pS", ":PackerStatus<CR>", { silent = true })
vim.keymap.set("n", "<leader>pc", ":PackerCompile<CR>", { silent = true })
vim.keymap.set("n", "<leader>pr", ":PackerClean<CR>", { silent = true })
----------------------------------------cscope--------------------------------------------------
vim.keymap.set("n", "<leader>sa", ":cscope find a <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>sc", ":cscope find c <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>sd", ":cscope find d <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>se", ":cscope find e <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>sf", ":cscope find f <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>sg", ":cscope find g <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>si", ":cscope find i <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>ss", ":cscope find s <cword><CR>", { silent = true })
vim.keymap.set("n", "<leader>st", ":cscope find t <cword><CR>", { silent = true })

vim.keymap.set("n", "<leader>st", ":source %<CR>", { silent = true })
