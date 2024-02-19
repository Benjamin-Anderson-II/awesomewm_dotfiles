vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<enter>', {})
vim.api.nvim_set_keymap('n', '<C-s>', ':w<enter>', {})

vim.api.nvim_set_keymap('i', '<C-e>', '<esc>:wq<enter>', {})

vim.api.nvim_set_keymap('i', '<C-n>', '<esc>:NvimTreeToggle<enter>', {})
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<enter>', {})

vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<enter>', {})

vim.api.nvim_set_keymap('n', '<C-Space>', ':lua require("telescope.builtin").find_files({ hidden = true })<enter>', {})
