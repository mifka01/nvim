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
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = "31807eef4ed574854b8a53ae40ea3292033a78ea" }) -- Useful lua functions used by lots of plugins
	use({ "numToStr/Comment.nvim", commit = "4818a4c2ecf64ace6358b81073ad5d76f657953d" }) -- Easily comment stuff

	-- Colorscheme
	--[[ use({ "morhetz/gruvbox", commit = "bf2885a95efdad7bd5e4794dd0213917770d79b7" }) -- Gruvbox colorscheme ]]
	use({ "nikolvs/vim-sunbather", commit = "64506a07a735ad92752e0e9935c4fc304f0327a4" }) -- Sunbather colorscheme

	-- Autopairs
	use({ "windwp/nvim-autopairs", commit = "34bd374f75fb58656572f847e2bc3565b0acb34f" }) -- Autopairs, integrates with both cmp and treesitter

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "3a9fb5262e620bfaa26b39bf02cfbd239bfaa7ff" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "3a5d0c894436dd6f4ee43187396a0136f1c56135" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "51775b12cfbf1b6462c7b13cd020cc09e6767aea" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer", commit = "ae913cb4fd62d7a84fb1582e11f2e15b4d597123" }) -- simple to use language server installer

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		commit = "d793de0f12d874c463e81edabee741b802c1a37a",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "48d88ddbff301d69703f0942c75603d545670782",
		run = ":TSUpdate",
	})

	-- Nvim Tree
	use({ "kyazdani42/nvim-web-devicons", commit = "969728506c0175644a1d448f55e311ccdada7eaf" })
	use({ "kyazdani42/nvim-tree.lua", commit = "261a5c380c000e23c4a23dcd55b984c856cdb113" })

	-- Null-ls
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "76d0573fc159839a9c4e62a0ac4f1046845cdd50" })

	-- Lualine
	use({ "nvim-lualine/lualine.nvim", commit = "c0510ddec86070dbcacbd291736de27aabbf3bfe" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
