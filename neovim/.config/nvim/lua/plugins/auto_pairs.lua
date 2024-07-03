return {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_in_macro = true,
                map_c_w = true,
            })
        end,
    }
