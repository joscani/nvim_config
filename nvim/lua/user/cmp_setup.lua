--require'cmp'.setup {
--  sources = {
--    { name = 'cmp_nvim_r' },
--  }
--}

require'cmp_nvim_r'.setup({
  filetypes = {'r', 'rmd', 'quarto'},
  doc_width = 58
  })

local lspkind = require('lspkind')
local cmp = require('cmp')
cmp.setup({
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
            before = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    vsnip = '',
                    path = '🖫',
                    cmp_zotcite = 'z',
                    cmp_nvim_r = 'R'
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        })
    },
    sources = cmp.config.sources({
        { name = 'path', option = { trailing_slash = true } },  
        { name = 'cmp_nvim_r' }, 
        {name = 'buffer', keyword_length = 2},     
        { name = 'vsnip' },
        { name = 'cmp_zotcite' },
    
        { name = 'otter' },
        { name = 'nvim_lsp' },
       
    }),
mapping = {
   ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
   ['<Down>'] = cmp.mapping.select_next_item(select_opts),
                                                                           
   ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
   ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
                                                                           
   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
   ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                                                           
   ['<C-e>'] = cmp.mapping.abort(),
   ['<CR>'] = cmp.mapping.confirm({select = false}),
                                                                           
   ['<C-d>'] = cmp.mapping(function(fallback)
     if luasnip.jumpable(1) then
       luasnip.jump(1)
     else
       fallback()
     end
   end, {'i', 's'}),
                                                                           
   ['<C-b>'] = cmp.mapping(function(fallback)
     if luasnip.jumpable(-1) then
       luasnip.jump(-1)
     else
       fallback()
     end
   end, {'i', 's'}),
                                                                           
   ['<Tab>'] = cmp.mapping(function(fallback)
     local col = vim.fn.col('.') - 1
                                                                           
     if cmp.visible() then
       cmp.select_next_item(select_opts)
     elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
       fallback()
     else
       cmp.complete()
     end
   end, {'i', 's'}),
                                                                           
   ['<S-Tab>'] = cmp.mapping(function(fallback)
     if cmp.visible() then
       cmp.select_prev_item(select_opts)
     else
       fallback()
     end
   end, {'i', 's'}),
 },

})
