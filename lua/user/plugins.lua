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

	-- { "nikolvs/vim-sunbather" }, -- Sunbather colorscheme
	-- { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "aktersnurra/no-clown-fiesta.nvim", opts = {
		transparent = true,
	} },
	-- { "sainnhe/gruvbox-material", priority = 1000, lazy = false },

	-- { "He4eT/desolate.nvim", dependencies = { "rktjmp/lush.nvim" } },
	--

	{ "norcalli/nvim-colorizer.lua" },
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
	{
		"onsails/lspkind.nvim",
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.1",
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

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
	-- Oil
    {
      'stevearc/oil.nvim',
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

	-- Lualine
	{ "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },

	{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim", commit = "a896a95851fe5c5adf71a50030d60f8fa488fa7e" },

	-- Smooth scrolling
	{ "declancm/cinnamon.nvim", branch = "master" },

	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = { max_count = 3 },
	},

	{
		"github/copilot.vim",
		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_enabled = false
		end,
		config = function()
			vim.keymap.set("i", "<S-Tab>", [[copilot#Accept("\<CR>")]], {
				silent = true,
				expr = true,
				script = true,
				replace_keycodes = false,
			})
		end,
	},
}, { ui = { border = "single" } })
