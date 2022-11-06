local mod = {}

function mod.setup()
    local present, telescope = pcall(require, "telescope")
    if not present then
        print("telescope is not installed")
        return
    end
    local builtin = require("telescope.builtin")
    telescope.setup({
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    mirror = false,
                },
                vertical = {
                    mirror = false,
                },
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = { "journal" },
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
            path_display = {},
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
    })
    vim.keymap.set("n", "<leader>t'", ":Telescope registers<CR>", { silent = true })
    vim.keymap.set("n", "<leader>t.", ":Telescope colorscheme<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ta", ":Telescope autocommands<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tb", ":Telescope branches<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tc", ":Telescope commands<CR>", { silent = true })
    vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tf", ":Telescope oldfiles<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tg", ":Telescope git_commits<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ti", ":Telescope lsp_implementations<CR>", { silent = true })
    vim.keymap.set("n", "<leader>th", ":Telescope help_tags<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tj", ":Telescope jumplist<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tl", ":Telescope live_grep<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tm", ":Telescope man_pages<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tn", ":Telescope marks<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tq", ":Telescope quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tr", ":Telescope lsp_references<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ts", ":Telescope git_status<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tt", ":Telescope git_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>t;", ":Telescope filetypes<CR>", { silent = true })
    vim.keymap.set("n", "<leader>te",
        function() builtin.find_files({ cwd = vim.fn.stdpath("config"), follow = true }) end,
        { silent = true })
    vim.keymap.set("n", "<leader>t;", function() builtin.find_files({ follow = true }) end,
        { silent = true })
end

return mod
