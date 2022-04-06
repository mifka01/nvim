local map = vim.api.nvim_set_keymap


map('n', '<space>', '<Nop>', {noremap = true})
vim.g.mapleader = ' '


-- Telescope keymaps
--
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {noremap = true})
map('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>", {noremap = true})
map('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", {noremap = true})
map('n', '<leader>gs', "<cmd>lua require'telescope.builtin'.git_status()<cr>", {noremap = true})


-- Trouble keymaps
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {noremap = true})
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', {noremap = true})

-- Vista keymaps
map('n', '<leader>vv', '<cmd>Vista!!<cr>', {noremap = true})

