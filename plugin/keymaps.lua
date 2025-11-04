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

set("n", "<leader><leader>x", "<cmd>source %<CR>")
set("n", "<leader>x", ":.lua<CR>")
set("v", "<leader>x", ":lua<CR>")

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

-- Git
set("n", "<leader>gh", ":0Gclog<CR>")
set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
set("n", "<leader>ds", ":Gdiffsplit<CR>")

-- Undotree
set("n", "<leader>ut", ":UndotreeToggle<CR>")
