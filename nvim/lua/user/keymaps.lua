vim.g.mapleader=' '

--WINDOWS
-- Vertical split
vim.keymap.set('n', '<leader>+',vim.cmd.vs)
-- Horizontal split
vim.keymap.set('n', '<leader>-',vim.cmd.split)
-- Move to window above
vim.keymap.set('n','<C-k>', '<C-w>k')
-- Move to window below
vim.keymap.set('n','<C-j>', '<C-w>j')
-- Move to left window
vim.keymap.set('n','<C-h>', '<C-w>h')
-- Move to right window
vim.keymap.set('n','<C-l>', '<C-w>l')
-- Increase current window width
vim.keymap.set('n','<C-Up>', [[<cmd>horizontal resize +5<cr>]])
-- Increase current window height
vim.keymap.set('n','<C-Left>', [[<cmd>vertical resize +5<cr>]])
-- Decrease current window width
vim.keymap.set('n','<C-Down>', [[<cmd>horizontal resize -5<cr>]])
-- Decrease current window heigth
vim.keymap.set('n','<C-Right>', [[<cmd>vertical resize -5<cr>]])
