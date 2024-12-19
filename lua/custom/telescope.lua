local data = assert(vim.fn.stdpath("data")) --[[@as string]]

require("telescope").setup({
	extensions = {
		smart_open = {
			cwd_only = true,
			match_algorithm = "fzf",
			disable_devicons = false,
		},
		fzf = {},
		wrap_results = true,
		history = {
			path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
			limit = 100,
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")

local builtin = require("telescope.builtin")
local smart_open = require("telescope").extensions.smart_open

vim.keymap.set("n", "<leader>ff", smart_open.smart_open)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
