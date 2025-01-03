vim.g.mapleader=' '
--vim.api.nvim_set_keymap('i', '(', '()<Esc>i', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('i', '[', '[]<Esc>i', {noremap = true, silent = true})
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})
vim.keymap.set('i', '<C-l>','<C-o>$')
--vim.keymap.set('t','<C-e>','<A-\\><C-n>') 
vim.keymap.set('t', '<<', ' |> ',{noremap=true})
vim.keymap.set('i', '<<' ,' |> ')
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
-- Increase, decrease windows size
vim.keymap.set('n','<C-Right>', [[<cmd>vertical resize +5<cr>]])
vim.keymap.set('n','<C-Left>', [[<cmd>vertical resize -5<cr>]])
vim.keymap.set('n','<C-Down>', [[<cmd>horizontal resize +5<cr>]])
vim.keymap.set('n','<C-Up>', [[<cmd>horizontal resize -5<cr>]])
-- Decrease current window width
-- Close window
vim.keymap.set('n', '<C-q>', vim.cmd.quit)

--TABS
--Open new tab
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew)
-- Close tab
vim.keymap.set('n', '<C-w>', vim.cmd.tabclose)
-- Switch to previous tab
vim.keymap.set('n', '<C-p>', vim.cmd.tabprevious) --conflicto con telescope
-- Switch to next tab
vim.keymap.set('n', '<C-n>', vim.cmd.tabnext) -- conflicto con neotree


--BUFFERS
--Previous buffer
vim.keymap.set('n','<S-Left>', vim.cmd.bprevious)
--Next buffer
vim.keymap.set('n','<S-Right>', vim.cmd.bnext)
--List buffer
vim.keymap.set('n','<S-Down>', vim.cmd.buffers)
--Go to buffer
vim.keymap.set('n','<S-Up>',':buffer')
--Delete  buffer
vim.keymap.set('n','<S-Del>',vim.cmd.bdelete)

-- Omni complete
--vim.keymap.set('i', '<Tab>','<C-x><C-o>')
-- Save file on exit insert and normal mode
--vim.keymap.set('i', '<C-c>','<Esc>:wa<CR>')
--vim.keymap.set('n', '<C-c>','<Esc>:wa<CR>')
--Show keymaps
vim.keymap.set('n', '<leader>?', vim.cmd.map)
--Replace word under the cursor
vim.keymap.set('n','<leader>r',':%s/<C-r><C-w>//g<Left><Left>')
--Find file
vim.keymap.set('n', '<leader>f',':find')
--Netrw File Explorer
vim.keymap.set('n','<leader>e',':Lex 30<CR>')
--Toggle list
vim.keymap.set('n','<F3>',':set list!<CR>')
--Togle highlight search
vim.keymap.set('n','<F5>', ':set hls!<CR>')

-- Show relative numbers
vim.keymap.set('n','<leader>1', ':set relativenumber<CR>')
vim.keymap.set('n','<leader>2', ':set norelativenumber<CR>')

-- VISUAL MODE
-- Replace
vim.keymap.set('v','<leader>r',':s/')
--Yank selection to clipboard
vim.keymap.set('v','<leader>y','"+y')

-- Delete selection to void register
vim.keymap.set('v','<leader>d', '"_d')

-- Delete selection into the void register and then paste over it
vim.keymap.set('v', '<leader>p','_dP')


-- MOVEMENT
vim.keymap.set('n','J','mzJ`z')
-- Join next line keeping cursor position
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- faltan por añadir cosas
-- LOCATION LIST
--Navigate through location list
vim.keymap.set('n', '<C-PageUp>', vim.cmd.lprev)
vim.keymap.set('n', '<C-PageDown>', vim.cmd.linext)

vim.keymap.set('n', '<leader>w', ':w<cr>')

