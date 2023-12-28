-- First config for lazyvim, https://github.com/folke/neodev.nvim
return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { 'jalvesaq/Nvim-R', lazy = false },
  { 'jalvesaq/cmp-nvim-r', lazy = false },
  -- lsp y cmp
  { 'onsails/lspkind.nvim'},
  { 'neovim/nvim-lspconfig'},
  { 'hrsh7th/cmp-nvim-lsp'},
  { 'hrsh7th/cmp-buffer'}, 
  { 'hrsh7th/cmp-path'}, 
  { 'hrsh7th/cmp-cmdline'}, 
  { 'hrsh7th/nvim-cmp'},
  {'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {},}, 
  {'hzchirs/vim-material', lazy  = false}, 
  {"williamboman/mason.nvim", lazy = false},
}
