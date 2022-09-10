local M = {}
M.setup = function()
    local avail, wk = pcall(require, "which-key")
    if not avail then
        print("which key is required")
        return
    end
    wk.register({
        t = {
            name = "Treesitter",
            ["'"] = { ":Telescope registers<CR>", "registers" },
            ["."] = { ":Telescope colorscheme<CR>", "Colorschems" },
            a = { ":Telescope autocommands<CR>", "autocommands" },
            b = { ":Telescope branches<CR>", "git branches" },
            c = { ":Telescope commands<CR>", "telescope commands" },
            d = { ":Telescope diagnostics<CR>", "diagnostics" },
            e = {
                function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), follow = true }) end,
                "diagnostics",
            },
            f = { ":Telescope oldfiles<CR>", "recent files" },
            g = { ":Telescope git_commits<CR>", "commits" },
            i = { ":Telescope lsp_implementations<CR>", "implementations" },
            h = { ":Telescope help_tags<CR>", "vim help_tags" },
            j = { ":Telescope jumplist<CR>", "jump list" },
            k = { ":Telescope keymaps<CR>", "keymaps" },
            l = { ":Telescope live_grep<CR>", "live_grep" },
            m = { ":Telescope man_pages<CR>", "man_pages" },
            n = { ":Telescope marks<CR>", "marks" },
            q = { ":Telescope quickfix<CR>", "quickfix list" },
            r = { ":Telescope lsp_references<CR>", "references" },
            s = { ":Telescope git_status<CR>", "Git status" },
            t = { ":Telescope git_files<CR>", "Git files" },
            [";"] = { ":Telescope filetypes<CR>", "set filetype" },
            ["<space>"] = { function() require("telescope.builtin").find_files({ follow = true }) end, "find files" },
        },
    }, { prefix = "<leader>" })
end

return M
