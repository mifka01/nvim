local data = assert(vim.fn.stdpath("data")) --[[@as string]]

require("telescope").setup({
	extensions = {
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

vim.keymap.set("n", "<space>ff", builtin.find_files)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<space>fb", builtin.buffers)
vim.keymap.set("n", "<space>fg", builtin.live_grep)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<space>gw", builtin.grep_string)

vim.keymap.set("n", "<space>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
