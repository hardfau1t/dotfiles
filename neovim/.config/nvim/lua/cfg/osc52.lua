local function copy(lines, _)
    require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
    return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end
local mod  = {}

mod.setup = function ()
    if vim.fn.has('clipboard') == 0 then

        require('osc52').setup {
            max_length = 0,           -- Maximum length of selection (0 for no limit)
            silent = false,           -- Disable message on successful copy
            trim = false,             -- Trim surrounding whitespaces before copy
            tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
        }
        vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true, desc = "copy given text to clipboard"})
        vim.keymap.set('n', '<leader>yy', '<leader>y_', {remap = true, desc = "copy current line"})
        vim.keymap.set('v', '<leader>y', require('osc52').copy_visual, {desc = "copy selection"})
    else
        vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', {desc = "copy to system clipboard"})
    end 
end

return mod
