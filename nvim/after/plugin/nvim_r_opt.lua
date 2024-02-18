-- shortcuts
vim.cmd("nmap <C-Space> <Plug>RDSendLine")
vim.cmd("vmap <C-Space> <Plug>RDSendSelection")
vim.cmd("imap jk <Esc>:call SendLineToR('stay')<CR><Down><Home>i")

-- init options

vim.g.R_auto_start = 1
vim.g.R_objbr_auto_start = 1
vim.g.R_start_libs = 'base,stats,graphics,grDevices,utils,methods'
vim.g.R_objbr_place = 'console,above'
vim.g.R_editor_w = 60
vim.g.R_show_args = 1

