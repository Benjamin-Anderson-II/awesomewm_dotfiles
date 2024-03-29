return {
  'neovim/nvim-lspconfig',
--  event = "VeryLazy",
  ft = {"lua", "python", "make", "c", "ruby"},
  config = function ()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup{}
    lspconfig.pylsp.setup{
      settings = {
        configurationSources = {"flake8"},
        pylsp = {
          plugins = {
            flake8 = {
              enabled = true,
              maxLineLength = 127,
              maxComplexity = 10,
            }
          }
        }
      }
    }
    lspconfig.lua_ls.setup{}
    lspconfig.clangd.setup{}
    lspconfig.autotools_ls.setup{}
    lspconfig.asm_lsp.setup{}
    lspconfig.ruby_ls.setup{}
--    lspconfig.rust_analyzer.setup{}
  end
}
