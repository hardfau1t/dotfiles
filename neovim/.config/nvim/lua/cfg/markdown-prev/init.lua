local mod = {}

mod.setup = function()
        vim.g.mkdp_browserfunc = function(url)
                print(url)
        end
        require("cfg.markdown-prev.keymaps")
end

return mod
