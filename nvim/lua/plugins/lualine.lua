-- return {
--     "nvim-lualine/lualine.nvim",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
-- }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Asegúrate de incluir los íconos si los usas
  config = function()
    -- Opciones generales de Neovim
    vim.opt.showmode = false

    -- Configuración de lualine
    require('lualine').setup({
      options = {
        -- theme = 'onedark',
        theme = 'material',
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = { 'NvimTree' }
        }
      },
    })
  end
}

