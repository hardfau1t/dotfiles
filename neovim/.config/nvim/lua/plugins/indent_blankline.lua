return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup({
            exclude = {
                filetypes = { "dashboard" }
            }
        })
    end,
}
