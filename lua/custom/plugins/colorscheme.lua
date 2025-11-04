-- { "nikolvs/vim-sunbather" }, -- Sunbather colorscheme
return {
	{
		-- "aktersnurra/no-clown-fiesta.nvim",
		-- "miikanissi/modus-themes.nvim",
		"bluz71/vim-moonfly-colors",

		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("no-clown-fiesta")
			vim.cmd.colorscheme("moonfly")
		end,
	},
}
