local v = vim
local o = v.opt

-- Disable netrw in favor of nvim-tree
v.g.loaded_netrw = 1
v.g.loaded_netrwPlugin = 1

-- moving around, searching and patterns
v.opt.whichwrap='b,s,h,l,<,>,[,]'

-- displaying text
o.number = true
o.wrap = false
o.scrolloff = 5
o.sidescrolloff = 5

-- syntax highlighting and spelling
o.termguicolors = true
o.cursorline = true
o.spelllang = 'en_us'
o.spell = true

-- using the mouse
o.mouse = 'a'

-- messages and info
o.showmode = false

-- editing text
o.undolevels = 10000
o.undofile = true

-- tabs and indenting
o.tabstop = 4
o.shiftwidth = 0
o.smarttab = false
o.shiftround = true
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- Folding
--o.foldmethod = "expr"
--o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "0"
--o.foldtext = ""
o.foldlevel = 99
o.foldlevelstart = 99
--o.foldnestmax = 4
o.foldenable = true

v.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {'*.txt', '*.md', '*.wiki'},
  command = 'setlocal nolist wrap linebreak breakat&vim'
})
v.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {'*.lua'},
  command = "setlocal tabstop=2",
})
v.cmd("autocmd FileType vimwiki nnoremap <buffer> <Leader>wx :VimwikiToggleListItem<CR>")

v.cmd("let g:wiki_root = '~/wiki'")
v.cmd("let g:vimwiki_ext2syntax = {}")
v.cmd('let g:mapleader = " "')
