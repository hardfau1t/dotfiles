local mod = {}

mod.setup = function()
  require("ibl").setup({
      exclude = {
          filetypes = {"dashboard"}
      }
  })
end

return mod
