return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<leader>e"] = "actions.close",
				},
				view_options = {
					show_hidden = true,
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
