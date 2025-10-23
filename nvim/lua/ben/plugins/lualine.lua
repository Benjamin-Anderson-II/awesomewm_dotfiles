return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { {'mode', separator = { left = '' }, right_padding = 2 }},
      lualine_b = {'branch', 'diff', {'diagnostics', update_in_insert = true}},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_z = {{'location', separator = {right = ''}, left_padding = 2}},
    }
  }
}
