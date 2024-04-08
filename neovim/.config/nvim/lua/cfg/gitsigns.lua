local mod = {}

mod.on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
        opts = {}
        opts.buffer = bufnr
        if not desc ~= nil then
            opts.desc = desc
        end
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
    end, "next hunk")

    map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
    end, "previous hunk")

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk, "stage hunk")
    map('n', '<leader>hr', gs.reset_hunk, "reset hunk")
    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "stage hunk")
    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "reset hunk")
    map('n', '<leader>hS', gs.stage_buffer, "stage buffer")
    map('n', '<leader>hu', gs.undo_stage_hunk, "undo stage hunk")
    map('n', '<leader>hR', gs.reset_buffer, "reset buffer")
    map('n', '<leader>hp', gs.preview_hunk, "preview hunk")
    map('n', '<leader>hb', function() gs.blame_line { full = true } end, "blame line")
    map('n', '<leader>tb', gs.toggle_current_line_blame, "toggle line blame")
    map('n', '<leader>hd', gs.diffthis, "diff")
    map('n', '<leader>hD', function() gs.diffthis('~') end, "diff agains ~")
    map('n', '<leader>td', gs.toggle_deleted, "toggle deleted")

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return mod
