-- { "nikolvs/vim-sunbather" }, -- Sunbather colorscheme
-- { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
return {
	{
		-- "aktersnurra/no-clown-fiesta.nvim",
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		-- opts = { transparent = true },
		config = function()
			vim.cmd.colorscheme("lackluster-mint")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		end,
	},
}
