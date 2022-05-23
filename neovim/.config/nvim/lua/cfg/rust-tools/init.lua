local M = {}
local custom_attach = function(_, bufnr)
  require("cfg.lsp.keymaps").setup(bufnr)
end

M.setup = function()
  local opts = {
    server = {
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importPrefix = "by_self",
          },
          checkOnSave = {
            command = "clippy",
            allTargets = true,
          },
          rustfmt = {
            extraArgs = { "--config", "tab_spaces=" .. vim.o.shiftwidth },
          },
        },
      },
      on_attach = custom_attach,
    },
  }
  require("rust-tools").setup(opts)
end

return M
