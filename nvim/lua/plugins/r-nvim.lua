--return {
--    {
--    "R-nvim/R.nvim",
--    lazy = false,
--    opts = {
--      auto_start = "always",
--      objbr_place = 'console,above',
--   },
--   vim.keymap.set('n', '<C-Space>', '<Plug>RDSendParagraph'),
--   vim.keymap.set('v', '<C-Space>', '<Plug>RDSendSelection'),
--   vim.keymap.set('i', 'jk', '<Esc><Plug>RDSendLine i'),
--  },
--  "R-nvim/cmp-r",
--  {
--    "hrsh7th/nvim-cmp",
--    config = function()
--      require("cmp").setup({ sources = {{ name = "cmp_r" }}})
--      require("cmp_r").setup({ })
--    end,
--  },
--}

return {
  {
    'R-nvim/R.nvim',
    lazy = false,
    opts = {
      R_args = { '--quiet', '--no-save' },
      hook = {
        on_filetype = function()
          -- mapear Ctrl + Enter
          vim.api.nvim_buf_set_keymap(0, 'n', '<C-Space>', '<Plug>RDSendParagraph', {})
          vim.api.nvim_buf_set_keymap(0, 'v', '<C-Space>', '<Plug>RDSendSelection', {})
          vim.api.nvim_buf_set_keymap(0, 'i', 'jk', '<Esc><Plug>RDSendLine i', {})
        end,
      },
      --rconsole_width = 0,
      --rconsole_height = 15,
      auto_start = "always",
      objbr_place = 'console,above',
      disable_cmds = {
        'RClearConsole',
        'RCustomStart',
        'RSPlot',
        'RSaveClose',
      },
    },
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

