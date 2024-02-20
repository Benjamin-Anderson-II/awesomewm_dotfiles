return {
  'neovim/nvim-lspconfig',
--  event = "VeryLazy",
  ft = {"lua", "py", "make", "c", "ruby"},
  config = function ()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup{}
    lspconfig.pylsp.setup{}
    lspconfig.lua_ls.setup{}
    lspconfig.clangd.setup{}
    lspconfig.autotools_ls.setup{}
    lspconfig.asm_lsp.setup{}
    lspconfig.ruby_ls.setup{}
--    lspconfig.rust_analyzer.setup{}
  end
}
