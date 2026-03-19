local set = vim.keymap.set

--Remap space as leader key
set("", "<Space>", "<Nop>")

-- Basic --
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

set("x", "<leader>p", '"_dP', { desc = "Paste without yank" })

-- Navigate buffers
set("n", "<S-p>", "<C-^>", { desc = "Alternate buffer" })

set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line as Lua" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection as Lua" })

-- Visual --
-- Stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Visual Block --
-- Move text up and down
set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selection down" })
set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selection up" })

-- Replace
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Git
set("n", "<leader>gh", ":0Gclog<CR>", { desc = "Git file history" })
set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git blame line" })
set("n", "<leader>ds", ":Gdiffsplit<CR>", { desc = "Git diff split" })

-- Undotree
set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle undotree" })
