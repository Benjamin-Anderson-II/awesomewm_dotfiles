require("ben.core")
require("ben.lazy")
local lspconfig = require('lspconfig')
vim.cmd("let g:wiki_root = '~/wiki'")

lspconfig.pyright.setup{}
--lspconfig.autopep8.setup{}
lspconfig.lua_ls.setup{}
--lspconfig.luacheck.setup{}
lspconfig.clangd.setup{}
