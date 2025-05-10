return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuración de servidores LSP
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              exclude = { "**/venv", "**/__pycache__", "**/node_modules" },
            },
          },
        },
        on_init = function(client)
          client.config.settings.python.pythonPath = vim.fn.exepath("python3")
          return true
        end,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })

      vim.lsp.config("r_language_server", {
        capabilities = capabilities,
      })

      vim.lsp.config("jedi_language_server", {
        capabilities = capabilities,
      })

      vim.lsp.config("julials", {
        capabilities = capabilities,
      })

      -- Keymaps en LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Acciones LSP",
        callback = function()
          local bufmap = function(mode, lhs, rhs)
            if rhs ~=nil then
                local opts = { buffer = true }
                vim.keymap.set(mode, lhs, rhs, opts)
            end
          end


          bufmap("n", "K", vim.lsp.buf.hover)
          bufmap("n", "gd", vim.lsp.buf.definition)
          bufmap("n", "gD", vim.lsp.buf.declaration)
          bufmap("n", "gi", vim.lsp.buf.implementation)
          bufmap("n", "go", vim.lsp.buf.type_definition)
          bufmap("n", "gr", vim.lsp.buf.references)
          bufmap("n", "<C-S-k>", vim.lsp.buf.signature_help)
          bufmap("n", "<F2>", vim.lsp.buf.rename)
          bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
          bufmap("x", "<F4>", vim.lsp.buf.range_code_action)
          bufmap("n", "gl", vim.diagnostic.open_float)
          bufmap("n", "[d", vim.diagnostic.goto_prev)
          bufmap("n", "]d", vim.diagnostic.goto_next)
        end,
      })

      -- Comandos LSP
      vim.api.nvim_create_user_command("LspLocList", function()
        vim.diagnostic.setloclist()
      end, {})

      vim.api.nvim_create_user_command("LspRename", function()
        vim.lsp.buf.rename()
      end, {})

      vim.api.nvim_create_user_command("LspFormat", function()
        vim.lsp.buf.format({ async = true })
      end, {})

      -- Signos en el gutter
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = "",
        })
      end

      sign({ name = "DiagnosticSignError", text = "✘" })
      sign({ name = "DiagnosticSignWarn",  text = "▲" })
      sign({ name = "DiagnosticSignHint",  text = "⚑" })
      sign({ name = "DiagnosticSignInfo",  text = "" })

      -- Config diagnósticos
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Bordes redondeados para hover y firmas
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "rounded" }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded" }
      )
    end,
  },
}

