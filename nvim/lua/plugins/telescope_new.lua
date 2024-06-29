return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})

      -- Telescope
      -- Muestra la lista de archivos abiertos.
      vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
      -- Muestra el historial de archivos.
      vim.keymap.set('n', '<leader>??', '<cmd>Telescope oldfiles<cr>')
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
      -- Ejecuta una búsqueda interactiva en el archivo actual.
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
      require("telescope").load_extension("ui-select")
    end,
  },
}
