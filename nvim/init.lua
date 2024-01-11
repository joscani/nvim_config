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



require("user")
require("user.options")
require("user.keymaps")


-- lazyvim after user 

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("user.plugins")

-- colorschemes and mason
require("user.colorscheme")
require("user.mason_setup")

-- Nvim R , lsp and cmp options and shortcuts

require("user.cmp_setup")
require("user.lspconfig_setup")
require("user.nvim_r_opt")
require("user.quarto_opts")

-- lualine config
require("user.lualine")



