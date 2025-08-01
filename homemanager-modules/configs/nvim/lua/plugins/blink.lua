return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'cargo build --release --target-dir target',
    opts = {
        keymap = {
            preset = 'default',
            ['Tab'] = false,
            ['S-Tab'] = false,
            ['C-e'] = { 'snippet_backward', 'fallback' },
            ['C-i'] = { 'snippet_forward', 'fallback' },
            ['C-c'] = { 'hide', 'fallback' },
        },
        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true },
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "rust" },
        cmdline = {
            enabled = true,
            completion = { menu = { auto_show = true } },
            keymap = {
                preset = "inherit"
            }
        }
    },
    opts_extend = { "sources.default" }
}
