local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Navigate buffers
keymap("n", "<S-p>", "<C-^>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("x", "<S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-Up>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>ff", ":AerialClose<CR>:Telescope find_files<CR>", opts)
keymap("n", "<leader>gf", ":AerialClose<CR>:Telescope git_files<CR>", opts)
keymap("n", "<leader>fg", ":AerialClose<CR>:Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":AerialClose<CR>:Telescope buffers<CR>", opts)
keymap("n", "<leader>fm", ":AerialClose<CR>:Telescope media_files<CR>", opts)

-- mini.files
keymap("n", "<leader>e", ":lua MiniFiles.open()<cr>", opts)

-- Replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Toggle diagnostics
keymap("n", "<leader>td", "<Plug>(toggle-lsp-diag-vtext)", opts)
keymap("n", "<leader>tf", ":lua vim.diagnostic.open_float()<CR>", opts)
