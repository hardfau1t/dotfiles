do
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

    -- buffer management
    vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true, desc = "next buffer" })
    vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true, desc = "previous buffer" })
    vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { silent = true, desc = "flush current buffer" })
    vim.keymap.set("n", "<leader>bc", clean_buf,
        { silent = true, desc = "remove all non opened buffers(which are not on any window)" })

    -- shifting in visual mode
    vim.keymap.set("v", ">", ">gv", { silent = true })
    vim.keymap.set("v", "<", "<gv", { silent = true })

    vim.keymap.set("v", "P", '"_dP', { silent = true })
    vim.keymap.set({"n", "v"}, "<leader>y", '"+y', {desc = "copy to system clipboard"})
    vim.keymap.set("n", "gy", ':let @+ = expand("%")<cr>', {desc = "copy relative path to system clipboard"})
    vim.keymap.set("n", "gY", ':let @+ = expand("%:p")<cr>', {desc = "copy absolute path to system clipboard"})


    vim.keymap.set("n", "<leader>st", ":source %<CR>", { silent = true })

    -- quickfix list movement
    vim.keymap.set("n", "<leader>qn", "<CMD>cnext<CR>", {desc = "next quickfix item"})
    vim.keymap.set("n", "<leader>qp", "<CMD>cprev<CR>", {desc = "prev quickfix item"})
    vim.keymap.set("n", "<leader>qg", "<CMD>cfirst<CR>", {desc = "first quickfix item"})
    vim.keymap.set("n", "<leader>qG", "<CMD>clast<CR>", {desc = "last quickfix item"})
end
