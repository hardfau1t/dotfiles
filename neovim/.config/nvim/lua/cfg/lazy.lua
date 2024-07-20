-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
    print("lazy is not installed")
    return
end

lazy.setup({
    spec = {
        import = "plugins"
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = true, -- get a notification when changes are found
    }
})

vim.keymap.set("n", "<leader>p", ":Lazy<CR>", {desc = "open package manager(lazy)"})
