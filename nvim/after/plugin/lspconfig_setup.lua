-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{}
--lspconfig.pyright.setup{}
lspconfig.lua_ls.setup({})
lspconfig.r_language_server.setup({})
lspconfig.jedi_language_server.setup{}
lspconfig.julials.setup{}

--lspconfig.pylsp.setup({})
--lspconfig.pylsp.setup({
-- settings = {
--        pylsp = {
--            plugins = {
--                ruff = {
--                    -- formatter + Linter + isort
--                    enabled = true,
--                    extendSelect = { "I" },
--                },
--                -- formatter options
--                black = { enabled = false },
--                autopep8 = { enabled = false },
--                yapf = { enabled = false },
--                -- linter options
--                pylint = { enabled = false, executable = "pylint" },
--                pyflakes = { enabled = false },
--                pycodestyle = { enabled = false },
--                -- type checker
--                pylsp_mypy = { enabled = true },
--                mypy = { enabled = true },
--                -- auto-completion options
--                jedi_completion = { fuzzy = true },
--                -- import sorting
--                pyls_isort = { enabled = false },
--            },
--        },
--    },
--})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Acciones LSP',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Muestra información sobre símbolo debajo del cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Saltar a definición
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Saltar a declaración
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Mostrar implementaciones
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Saltar a definición de tipo
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Listar referencias
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Mostrar argumentos de función <C-k> choca con keybind para mover ventana
    bufmap('n', '<S-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renombrar símbolo
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Listar "code actions" disponibles en la posición del cursor
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Mostrar diagnósticos de la línea actual
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Saltar al diagnóstico anterior
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Saltar al siguiente diagnóstico
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})


vim.api.nvim_create_user_command('LspLocList', function(opts)
    vim.diagnostic.setloclist()
    end, {})

vim.api.nvim_create_user_command('LspRename', function(opts)
    vim.lsp.buf.rename()
end, {})

vim.api.nvim_create_user_command('LspFormat', function(opts)
    vim.lsp.buf.format({async=true})
end, {})


local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)


--- indicar que el autocompletado es por cmp
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})
lspconfig.r_language_server.setup({
  capabilities = lsp_capabilities,
})
lspconfig.jedi_language_server.setup({
  capabilities = lsp_capabilities,
})


lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
