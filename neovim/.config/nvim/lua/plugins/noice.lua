return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        presets = {
            lsp_doc_border = true,       -- add a border to hover docs and signature help
        }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}
