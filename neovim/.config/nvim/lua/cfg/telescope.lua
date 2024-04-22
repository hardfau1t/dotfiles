
local function set_keymap()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>t'", ":Telescope registers<CR>", { silent = true, desc = "fuzzy find registers" })
    vim.keymap.set("n", "<leader>t.", ":Telescope colorscheme<CR>", { silent = true, desc = "colorscheme switcher" })
    vim.keymap.set("n", "<leader>ta", ":Telescope autocommands<CR>", { silent = true, desc = "find all autocommands" })
    vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", { silent = true, desc = "list all buffers" })
    vim.keymap.set("n", "<leader>tc", ":Telescope commands<CR>", { silent = true, desc = "show all nvim ex commands" })
    vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<CR>", { silent = true, desc = "fuzzy find diagnostics" })
    vim.keymap.set("n", "<leader>te",
        function() builtin.find_files({ cwd = vim.fn.stdpath("config"), follow = true }) end,
        { silent = true, desc = "fuzzy find neovim config files" })
    vim.keymap.set("n", "<leader>tf", ":Telescope oldfiles<CR>", { silent = true, desc = "show recent modified files" })
    vim.keymap.set("n", "<leader>tg", ":Telescope git_commits<CR>", { silent = true, desc = "show all git commits" })
    vim.keymap.set("n", "<leader>th", ":Telescope help_tags<CR>", { silent = true, desc = "vim help tags" })
    vim.keymap.set("n", "<leader>ti", ":Telescope lsp_implementations<CR>",
        { silent = true, desc = "search lsp implementations" })
    vim.keymap.set("n", "<leader>tj", ":Telescope jumplist<CR>", { silent = true, desc = "list jumplist" })
    vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<CR>", { silent = true, desc = "show keymaps" })
    vim.keymap.set("n", "<leader>tl", ":Telescope live_grep<CR>", { silent = true, desc = "live grep all files" })
    vim.keymap.set("n", "<leader>tm", ":Telescope bookmarks<CR>", { silent = true, desc = "search bookmarks" })
    vim.keymap.set("n", "<leader>tn", ":Telescope marks<CR>", { silent = true, desc = "show all marks" })
    vim.keymap.set("n", "<leader>tq", ":Telescope quickfix<CR>", { silent = true, desc = "fuzzy find quickfixlist" })
    vim.keymap.set("n", "<leader>tr", ":Telescope lsp_references<CR>",
        { silent = true, desc = "show lsp lsp references" })
    vim.keymap.set("n", "<leader>ts", ":Telescope git_status<CR>", { silent = true, desc = "show modified files in git" })
    vim.keymap.set("n", "<leader>tt", ":Telescope git_files<CR>", { silent = true, desc = "find git monitored files" })
    vim.keymap.set("n", "<leader>t;", ":Telescope filetypes<CR>", { silent = true, desc = "change current filetype" })
    vim.keymap.set("n", "<leader>t*", ":Telescope grep_string<CR>",
        { silent = true, desc = "find string under the cursor" })
    vim.keymap.set('n', "<leader>,", require'telescope'.extensions.luasnip.luasnip, {silent = true, desc = "show all available snippets"})
    vim.keymap.set("n", "<leader>t<space>", function() builtin.find_files({ follow = true }) end,
        { silent = true, desc = "fuzzy find files" })
end

local function load_extensions()
    require("telescope").load_extension('luasnip')
end

do
    local present, telescope = pcall(require, "telescope")
    if not present then
        print("telescope is not installed")
        return
    end
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
    load_extensions()
    set_keymap()
end
