-- install lazy.nvim
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

-- my init lua file 

require("user")
require("user.options")
require("user.keymaps")

-- lazyvim after user 

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("user.plugins")

-- Nvim R options and shortcuts

require("user.nvim_r_opt")
