return {
  'neovim/nvim-lspconfig',
--  event = "VeryLazy",
  ft = {"lua", "python", "make", "c", "ruby", "cpp", "sh", "haskell"},
  config = function ()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup{}
    lspconfig.pylsp.setup{
      settings = {
        configurationSources = {"pycodestyle", "flake8"},
        pylsp = {
          plugins = {
            flake8 = {
              enabled = true,
              maxLineLength = 127,
              maxComplexity = 10,
            },
            pycodestyle = {
              maxLineLength = 127
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
    lspconfig.ghcide.setup{}
  end
}
