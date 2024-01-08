vim.opt.shortmess="I"           --Remove splash screen
vim.opt.cursorline=true         --Show cursor line
vim.opt.number=true		          --Show line numbers
vim.opt.wrap=false		          --Do not wrap text
vim.opt.complete="."		        --Only use current buffer for autocomplete



--:vim.cmd[[colorscheme lunar]]
-- Show menu event with one entry, 

vim.opt.completeopt="menuone,noselect,noinsert,preview"
vim.opt.pumheight=10 		        -- Menu height (in lines)

-- Indentation

vim.opt.autoindent=true		      -- Auto indent
vim.opt.smartindent=true	      -- Smart indent
vim.opt.tabstop=2		            -- Show tab as two spacs
vim.opt.shiftwidth=2		        -- Indent using two columnas
vim.opt.expandtab=true		      -- Uses spaces instead of tabs

-- more options

vim.opt.undofile=true           -- Enable undo files
vim.opt.splitbelow=true         -- Create new horizontal windows below
vim.opt.splitright=true         -- Create new vertical windows to the right
vim.opt.hlsearch=true           -- Highlight search
vim.opt.incsearch=true          -- Incremental search
vim.opt.exrc=true               -- Add suport for local .nvim.lua configur
--vim.opt.mouse=""                -- Disable mouse
vim.opt.path=""..vim.fn.getcwd()..", "..vim.fn.getcwd().."/**"
