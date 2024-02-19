vim.o.nu = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.wrap = true
vim.opt.whichwrap:append({ ['h'] = true, ['l'] = true })
vim.o.spelllang = 'en_us'
vim.o.spell = true

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {'*.txt', '*.md'},
  command = 'setlocal nolist wrap linebreak breakat&vim'
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
