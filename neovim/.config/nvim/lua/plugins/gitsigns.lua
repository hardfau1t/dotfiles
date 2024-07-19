local function on_attach(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
        local opts = {}
        opts.buffer = bufnr
        if not desc ~= nil then
            opts.desc = desc
        end
        vim.keymap.set(mode, l, r, opts)
    end

    -- Actions
    map('n', '<leader>hn', function () gs.nav_hunk("next") end, "next hunk")
    map('n', '<leader>hN', function () gs.nav_hunk("last") end, "last hunk")
    map('n', '<leader>hp', function () gs.nav_hunk("prev") end, "last hunk")
    map('n', '<leader>hP', function () gs.nav_hunk("first") end, "last hunk")
    map('n', '<leader>hs', gs.stage_hunk, "stage hunk")
    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "stage hunk")
    map('n', '<leader>hr', gs.reset_hunk, "reset hunk")
    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "reset hunk")
    map('n', '<leader>hS', gs.stage_buffer, "stage buffer")
    map('n', '<leader>hu', gs.undo_stage_hunk, "undo stage hunk")
    map('n', '<leader>hR', gs.reset_buffer, "reset buffer")
    map('n', '<leader>hp', gs.preview_hunk, "preview hunk")
    map('n', '<leader>hb', gs.toggle_current_line_blame, "toggle line blame")
    map('n', '<leader>hB', gs.toggle_current_line_blame, "Show git blame")
    map('n', '<leader>hd', gs.diffthis, "diff")
    map('n', '<leader>hD', function() gs.diffthis('~') end, "diff agains ~")

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = on_attach,
        preview_config = {border = "single"},
        current_line_blame_formatter = '<author> : <abbrev_sha> : <author_time:%Y-%m-%d> - <summary>',
    }
}
