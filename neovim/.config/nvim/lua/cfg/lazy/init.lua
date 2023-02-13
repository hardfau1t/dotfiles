local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("cfg.lazy.plugins")

local status, lazy = pcall(require, "lazy")
if not status then
    print("lazy is not installed")
    return
end

lazy.setup(plugins, {})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("WriteSync", { clear = true }),
--     pattern = { "*plugins.lua" },
--     command = 'source <afile> | PackerSync '
-- })
-- 
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     -- 2 groups should have different name otherwise first group will be overwritten
--     group = vim.api.nvim_create_augroup("WriteCompile", { clear = true }),
--     pattern = { "*/.config/nvim/*" },
--     command = 'source <afile> | PackerCompile'
-- })
