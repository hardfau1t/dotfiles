return {

    {
        "nvim-neorg/neorg",
        lazy = true,
        version = "v7.0.0",
        -- load only when neorg cmd ran or shortcut is given
        cmd = { "Neorg workspace", "Neorg index", "Neorg" },
        keys = { "\\\\" },
        config = function()
            require("cfg.neorg").init()
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } } },
    },
    {
        'LhKipp/nvim-nu',
        lazy = true,
        build = ":TSInstall nu",
        ft = { "nu" },
        config = function()
            require("nu").setup({ use_lsp_features = false })
        end
    },
    -- nvim cmp plugin and sources
    {
        'NoahTheDuke/vim-just',
        lazy = true,
        ft = { "just" }
    },
    { 'elkowar/yuck.vim', lazy = true, ft = { "yuck" } },
    -- for copying remote to system clipboard
    {
        'ojroques/nvim-osc52',
        config = function()
            require("cfg.osc52").setup()
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup {}
        end
    }
}
