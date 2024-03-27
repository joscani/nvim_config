return {
    {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      auto_start = "always",
      objbr_place = 'console,above',
   },
   --vim.cmd("vmap <C-Space> <Plug>RDSendSelection"),
   --vim.cmd("imap jk <Esc>:call SendLineToR('stay')<CR><Down><Home>i"),
   vim.keymap.set('n', '<C-Space>', '<Plug>RDSendLine'),
   vim.keymap.set('v', '<C-Space>', '<Plug>RDSendSelection'),

  },
  "R-nvim/cmp-r",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({ sources = {{ name = "cmp_r" }}})
      require("cmp_r").setup({ })
    end,
  },
}
