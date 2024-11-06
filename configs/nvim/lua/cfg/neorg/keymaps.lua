local mod = {}

local function math_expr()
    local buf = vim.api.nvim_create_buf(true, true)
    if buf == 0 then
        print("failed to create buffer for math expression")
    end
    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width / 3)
    local height = math.floor(ui.height / 3)
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
        if cont and not vim.deep_equal(cont, { "$$" }) then
            vim.api.nvim_put(cont, "", true, true)
        end
    end

    vim.keymap.set("n", "q", write_expr, { buffer = buf })
    vim.keymap.set("n", "<esc>", write_expr, { buffer = buf })
end

return mod
