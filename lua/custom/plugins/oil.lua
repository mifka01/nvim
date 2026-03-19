return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		keys = {
			{ "<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory" },
		},
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
		end,
	},
}
