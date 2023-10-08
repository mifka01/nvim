local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
	{ "numToStr/Comment.nvim", tag = "v0.8.0" }, -- Easily comment stuff

	-- Colorscheme
	--[[ ({ "morhetz/gruvbox", commit = "bf2885a95efdad7bd5e4794dd0213917770d79b7" }) -- Gruvbox colorscheme ]]
	-- ({ "nikolvs/vim-sunbather" }) -- Sunbather colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"L3MON4D3/LuaSnip",
				opts = {
					history = true,
					delete_check_events = "TextChanged",
					region_check_events = "CursorMoved",
				},
			},
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.1",
	},

	-- Autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- Autopairs, integrates with both cmp and treesitter

	-- Null-ls
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Mason Null ls
	{ "jay-babu/mason-null-ls.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
	},

	-- Nvim Tree
	{ "nvim-tree/nvim-web-devicons", commit = "973ab742f143a796a779af4d786ec409116a0d87" },
	{ "nvim-tree/nvim-tree.lua", commit = "a3aa3b47eac8b6289f028743bef4ce9eb0f6782e" },

	-- Lualine
	{ "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },

	-- Smooth scroll
	{ "psliwka/vim-smoothie", commit = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e" },

	{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim", commit = "a896a95851fe5c5adf71a50030d60f8fa488fa7e" },

	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" } },
})
