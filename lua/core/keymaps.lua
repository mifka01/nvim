local map = vim.api.nvim_set_keymap


map('n', '<space>', '<Nop>', {noremap = true})
vim.g.mapleader = ' '


-- Telescope keymaps
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})


-- Trouble keymaps
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {noremap = true})
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', {noremap = true})

-- Vista keymaps
map('n', '<leader>vv', '<cmd>Vista!!<cr>', {noremap = true})

