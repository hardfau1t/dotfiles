return {

    "folke/neodev.nvim",
    {
        'ojroques/nvim-osc52',
        config = function()
            require("cfg.osc52").setup()
        end
    },
}
