local set = vim.keymap.set

--Remap space as leader key
set("", "<Space>", "<Nop>")

-- Basic --
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')

-- Navigate buffers
set("n", "<S-p>", "<C-^>")

-- Visual --
-- Stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Visual Block --
-- Move text up and down
set("x", "J", ":move '>+1<CR>gv-gv")
set("x", "K", ":move '<-2<CR>gv-gv")

-- Replace
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle diagnostics
-- set("n", "<leader>td", "<Plug>(toggle-lsp-diag-vtext)")
-- set("n", "<leader>tf", ":lua vim.diagnostic.open_float()<CR>")
