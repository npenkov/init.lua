vim.g.mapleader = " "

-- vim-tree
vim.keymap.set("n", "<C-e>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-y>", vim.cmd.NvimTreeFindFile)

-- buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev)
vim.keymap.set("n", "<leader>bc", vim.cmd.BufferClose)
vim.keymap.set("n", "<leader>bac", vim.cmd.BufferCloseAllButCurrent)
-- Re-order to previous/next
vim.keymap.set('n', '<C-<>', vim.cmd.bnext)
vim.keymap.set('n', '<C->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
vim.keymap.set('n', '<C-F1>', '<Cmd>BufferGoto 1<CR>')
-- vim.keymap.set('n', '<C-F2>', '<Cmd>BufferGoto 2<CR>')
-- vim.keymap.set('n', '<C-F3>', '<Cmd>BufferGoto 3<CR>')
-- vim.keymap.set('n', '<C-F4>', '<Cmd>BufferGoto 4<CR>')
-- vim.keymap.set('n', '<C-F5>', '<Cmd>BufferGoto 5<CR>')
-- vim.keymap.set('n', '<C-F6>', '<Cmd>BufferGoto 6<CR>')
-- vim.keymap.set('n', '<C-F7>', '<Cmd>BufferGoto 7<CR>')
-- vim.keymap.set('n', '<C-F8>', '<Cmd>BufferGoto 8<CR>')
-- vim.keymap.set('n', '<C-F9>', '<Cmd>BufferGoto 9<CR>')
-- vim.keymap.set('n', '<C-F0>', '<Cmd>BufferLast<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fa', ':lua require"telescope.builtin".find_files({ hidden = true, no_ignore = true })<CR>', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
