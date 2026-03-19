return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",

			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },

			-- Autoformatting
			"stevearc/conform.nvim",
		},
		config = function()
			require("custom.lsp")
		end,
	},
}
