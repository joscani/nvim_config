return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>'),
  vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>'),
  vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>'),
  vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>')
}


--return {
--  {
--  "christoomey/vim-tmux-navigator",
--  cmd = {
--    "TmuxNavigateLeft",
--    "TmuxNavigateDown",
--    "TmuxNavigateUp",
--    "TmuxNavigateRight",
--    "TmuxNavigatePrevious",
--  },
--  keys = {
--    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--  },
--}
--
--}

