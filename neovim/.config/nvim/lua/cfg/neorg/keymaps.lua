local mod = {}

local function math_expr()
    local buf = vim.api.nvim_create_buf(true, true)
    if buf == 0 then
        print("failed to create buffer for math expression")
    end
    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width / 3)
    local height = math.floor(ui.height/3)
    local win_options = {
        relative = 'editor',
        width = width,
        height = height,
        row = ui.height / 2 - height / 2,
        col = ui.width / 2 - width / 2,
        border = "rounded"
    }
    local win = vim.api.nvim_open_win(buf, true, win_options)
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.api.nvim_put({ "$$" }, "", true, true)
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    vim.cmd("MarkdownPreview")

    local function write_expr()
        local cont = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        vim.api.nvim_buf_delete(buf, {})
        -- ignore if the buffer is empty
        if cont and not vim.deep_equal(cont, {"$$"}) then
            vim.api.nvim_put(cont, "", true, true)
        end
    end

    vim.keymap.set("n", "q", write_expr, { buffer = buf })
    vim.keymap.set("n", "<esc>", write_expr, { buffer = buf })
end

mod.set_keymaps = function(kb)
    -- remaps all the non leader keys
    kb.remap_key("norg", "n", kb.leader .. "tc", kb.leader .. "c")
    kb.remap_key("norg", "n", kb.leader .. "tv", kb.leader .. "v")
    kb.remap_key("norg", "n", kb.leader .. "te", kb.leader .. "e")
    kb.remap_key("norg", "n", kb.leader .. "nn", kb.leader .. "n")
    kb.remap_key("norg", "n", "gtu", kb.leader .. "tu")
    kb.remap_key("norg", "n", "gtp", kb.leader .. "tp")
    kb.remap_key("norg", "n", "gtd", kb.leader .. "td")
    kb.remap_key("norg", "n", "gth", kb.leader .. "th")
    kb.remap_key("norg", "n", "gtc", kb.leader .. "tc")
    kb.remap_key("norg", "n", "gtr", kb.leader .. "tr")
    kb.remap_key("norg", "n", "gti", kb.leader .. "ti")
    -- journal shortcuts
    kb.map("norg", "n", kb.leader .. "jt", ":Neorg journal today<CR>")
    kb.map("norg", "n", kb.leader .. "jy", ":Neorg journal yesterday<CR>")
    kb.map("norg", "n", kb.leader .. "jm", ":Neorg journal tomorrow<CR>")
    -- Table of content
    kb.map("norg", "n", kb.leader .. "os", ":Neorg toc split<CR>")
    kb.map("norg", "n", kb.leader .. "oc", ":Neorg toc close<CR>")
    kb.map("norg", "n", kb.leader .. "oq", ":Neorg toc toqflist<CR>")
    kb.map_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
    kb.map("norg", "i", "<C-m>", math_expr)
    kb.map("norg", "n", "\\im", math_expr)
end

vim.keymap.set("n", "\\", "<nop>")
vim.keymap.set("n", "\\\\", ":NeorgStart<CR>")
return mod
