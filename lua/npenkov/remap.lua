vim.g.mapleader = " "

local km = vim.keymap

-- vim-tree
km.set("n", "<C-e>", vim.cmd.NvimTreeToggle)
km.set("n", "<C-y>", vim.cmd.NvimTreeFindFile)

-- buffers
km.set("n", "<leader>bn", vim.cmd.bnext)
km.set("n", "<leader>bp", vim.cmd.bprev)
km.set("n", "<leader>bc", vim.cmd.BufferClose)
km.set("n", "<leader>bac", vim.cmd.BufferCloseAllButCurrent)

local map = vim.api.nvim_set_keymap
local nnoremap_opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', nnoremap_opts)
map('n', '<S-l>', '<Cmd>BufferNext<CR>', nnoremap_opts)

-- Reload vim configuration
map('n', '<leader>gg','<cmd>LazyGit<cr>', nnoremap_opts)

-- telescope
local builtin = require('telescope.builtin')
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})
km.set('n', '<leader>fa', ':lua require"telescope.builtin".find_files({ hidden = true, no_ignore = true })<CR>', nnoremap_opts)

km.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<cr>", nnoremap_opts)
km.set("n", "<leader>pd", "<cmd>Telescope dir find_files<cr>", nnoremap_opts)

km.set("n", "<leader>fs", ":lua require('gfold').pick_repo()<cr>", nnoremap_opts)
