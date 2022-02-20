local mod = {}

mod.setup = function()
  require("indent_blankline").setup({
    char = " ",
    debug = true,
    context_char = "┆",
    use_treesitter = true,
    show_current_context = true,
    show_end_of_line = true,
    context_patterns = {".*"},
    filetype = { "lua", "python", "c", "rust", "css", "html", "htmldjango" },
  })
end

return mod
