-- { "nikolvs/vim-sunbather" }, -- Sunbather colorscheme
return {
	{
		-- "aktersnurra/no-clown-fiesta.nvim",
		"p00f/alabaster.nvim",

		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("alabaster")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
		end,
	},
}
