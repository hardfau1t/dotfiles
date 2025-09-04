local opts ={
  provider = "claude",
  ---7. support_paste_from_clipboard    : Whether to support pasting image from clipboard. This will be determined automatically based whether img-clip is available or not.
  ---8. minimize_diff                   : Whether to remove unchanged lines when applying a code block
  ---9. enable_token_counting           : Whether to enable token counting. Default to true.
  behaviour = {
    minimize_diff = true,
    enable_token_counting = false,
    auto_focus_on_diff_view = false,
    ---@type boolean | string[] -- true: auto-approve all tools, false: normal prompts, string[]: auto-approve specific tools by name
    auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
    auto_check_diagnostics = true,
  },
  windows = {
    sidebar_header = {
      enabled = false, -- true, false to enable/disable the header
    },
  },
  --- @class AvanteConflictConfig
  diff = {
    autojump = true,
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
  --- @class AvanteHintsConfig
  hints = {
    enabled = true,
  },
}

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = opts,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick",     -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "stevearc/dressing.nvim",    -- for input provider dressing
        "folke/snacks.nvim",         -- for input provider snacks
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        }
    },
}
