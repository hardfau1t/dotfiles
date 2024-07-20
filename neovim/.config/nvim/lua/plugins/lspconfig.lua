return {
    "neovim/nvim-lspconfig",
    config = function()
        require("cfg.lsp").setup()
    end,
}
