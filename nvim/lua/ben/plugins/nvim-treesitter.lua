return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      matchup = {
        enable = true,
        include_match_words = true,
      },
      indent = { enable = true },
      ensure_installed = {
        'c',
        'vim',
        'bash',
        'lua',
        'cpp',
        'json',
        'python',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = 'C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        }
      }
    })
  end
}
