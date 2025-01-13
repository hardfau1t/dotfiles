return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" , "Avante"},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        file_types = {"markdown", "Avante"}
    },
}
