require'nvim-treesitter.configs'.setup {
    ensure_installed ={ "rust", "c", "python", "lua", "bash", "html", "css", "yaml", "toml", "json"},
    highlight = {
    enable = true              -- false will disable the whole extension
    },
    indent = {
      enable = false
    },
    incremental_selection = {
        enable = true
    }
}
