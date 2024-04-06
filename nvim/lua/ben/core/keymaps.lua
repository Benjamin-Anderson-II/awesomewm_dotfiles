-- Saving to Enter Normal Mode
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('i', '<C-s>', '<esc>:w<enter>', opts)
map('n', '<C-s>', ':w<enter>', opts)

-- Save and Quit
map('i', '<C-e>', '<esc>:wq<enter>', opts)

-- Toggle Nvim Tree
map('i', '<C-n>', '<esc>:NvimTreeToggle<enter>', opts)
map('n', '<C-n>', ':NvimTreeToggle<enter>', opts)

-- Open Telescope
map('n', '<C-f>', ':Telescope live_grep<enter>', opts)
map('n', '<C-enter>', ':lua require("telescope.builtin").find_files({ hidden = true })<enter>', opts)

-- Crtl-Backspace
map('i', "<C-BS>", "<C-w>", opts)
map('n', "<C-BS>", "db", opts)

-- Git gutter
map('n', "]h", "<Plug>(GitGutterNextHunk)", opts)
map('n', "[h", "<Plug>(GitGutterPrevHunk)", opts)

--[[    barbar    ]]--

-- Move to previous/next
map('n', "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map('n', "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map('n', "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map('n', "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map('n', "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map('n', "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map('n', "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map('n', "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map('n', "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map('n', "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map('n', "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map('n', "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map('n', "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map('n', "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map('n', "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map('n', "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- open buffer right
map('n', "<A-S-1>", "<C-w>v<C-w>l<Cmd>BufferGoto 1<CR>", opts)
map('n', "<A-S-2>", "<C-w>v<C-w>l<Cmd>BufferGoto 2<CR>", opts)
map('n', "<A-S-3>", "<C-w>v<C-w>l<Cmd>BufferGoto 3<CR>", opts)
map('n', "<A-S-4>", "<C-w>v<C-w>l<Cmd>BufferGoto 4<CR>", opts)
map('n', "<A-S-5>", "<C-w>v<C-w>l<Cmd>BufferGoto 5<CR>", opts)
map('n', "<A-S-6>", "<C-w>v<C-w>l<Cmd>BufferGoto 6<CR>", opts)
map('n', "<A-S-7>", "<C-w>v<C-w>l<Cmd>BufferGoto 7<CR>", opts)
map('n', "<A-S-8>", "<C-w>v<C-w>l<Cmd>BufferGoto 8<CR>", opts)
map('n', "<A-S-9>", "<C-w>v<C-w>l<Cmd>BufferGoto 9<CR>", opts)
map('n', "<A-S-0>", "<C-w>v<C-w>l<Cmd>BufferLast<CR>", opts)
-- open buffer down
map('n', "<A-C-1>", "<C-w>s<C-w>j<Cmd>BufferGoto 1<CR>", opts)
map('n', "<A-C-2>", "<C-w>s<C-w>j<Cmd>BufferGoto 2<CR>", opts)
map('n', "<A-C-3>", "<C-w>s<C-w>j<Cmd>BufferGoto 3<CR>", opts)
map('n', "<A-C-4>", "<C-w>s<C-w>j<Cmd>BufferGoto 4<CR>", opts)
map('n', "<A-C-5>", "<C-w>s<C-w>j<Cmd>BufferGoto 5<CR>", opts)
map('n', "<A-C-6>", "<C-w>s<C-w>j<Cmd>BufferGoto 6<CR>", opts)
map('n', "<A-C-7>", "<C-w>s<C-w>j<Cmd>BufferGoto 7<CR>", opts)
map('n', "<A-C-8>", "<C-w>s<C-w>j<Cmd>BufferGoto 8<CR>", opts)
map('n', "<A-C-9>", "<C-w>s<C-w>j<Cmd>BufferGoto 9<CR>", opts)
map('n', "<A-C-0>", "<C-w>s<C-w>j<Cmd>BufferLast<CR>", opts)
