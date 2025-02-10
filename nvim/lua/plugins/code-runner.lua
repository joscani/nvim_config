--https://dev.to/rnrbarbosa/how-to-run-python-on-neovim-like-jupyter-3ln0

return {
  "hkupty/iron.nvim",
  config = function(plugins, opts)
    local iron = require("iron.core")
    main = 'iron.core'

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "python3" },
          },
          markdown = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "python3" },
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require("iron.view").right(60),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = "<C-space>", -- Enviar movimiento
        visual_send = "<C-space>", -- Enviar selección visual
        send_file = "<C-space>mf", -- Enviar archivo completo
        send_line = "<C-space>ml", -- Enviar línea actual
        clear = "<C-space>mx", -- Limpiar REPL
        exit = "<C-space>mq", -- Salir del REPL
      },
      -- keymaps = {
      --   send_motion = "<C-space>",
      --   visual_send = "<C-space>",
      --   send_file = "<C-space>sf",
      --   send_line = "<C-space>sl",
      --   send_mark = "<C-space>sm",
      --   mark_motion = "<C-space>mc",
      --   mark_visual = "<C-space>mc",
      --   remove_mark = "<C-space>md",
      --   cr = "<C-space>s<cr>",
      --   interrupt = "<C-space>s<space>",
      --   exit = "<C-space>sq",
      --   clear = "<C-space>cl",
      -- },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = false, -- ignore blank lines when sending visual select lines
    })


    -- Mapeos adicionales
    vim.keymap.set("n", "<C-space>mc", "<cmd>IronRepl<cr>") -- Abrir el REPL
    vim.keymap.set("n", "<C-space>mh", "<cmd>IronHide<cr>") -- Ocultar el REPL

    vim.cmd([[
      autocmd User IronSendPre lua vim.notify("Enviando código...")
      autocmd User IronSendPost lua require("iron.core").send(nil, {"\n"})
    ]])

  end,
}
