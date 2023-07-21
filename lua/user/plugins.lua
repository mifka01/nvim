local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "numToStr/Comment.nvim" }) -- Easily comment stuff

	-- Colorscheme
	--[[ use({ "morhetz/gruvbox", commit = "bf2885a95efdad7bd5e4794dd0213917770d79b7" }) -- Gruvbox colorscheme ]]
	-- use({ "nikolvs/vim-sunbather" }) -- Sunbather colorscheme
	use({ "rose-pine/neovim", as = "rose-pine" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Autopairs
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter

	-- Null-ls
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Mason Null ls
	use({ "jay-babu/mason-null-ls.nvim" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})

	-- Nvim Tree
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })

	-- Lualine
	use({ "nvim-lualine/lualine.nvim" })

	-- Smooth scroll
	use({ "psliwka/vim-smoothie" })

	use({ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
