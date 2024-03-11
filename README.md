# Neovim configuration with Lua

This config is based on [neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) and [primeagen-init](https://github.com/ThePrimeagen/init.lua) repos.

## Plugins

[autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopair plugin for Neovim.

[cinnamon](https://github.com/declancm/cinnamon.nvim) - Plugin makes scrolling nice and smooth.

[copilot](https://github.com/github/copilot.vim) - Plugin for GitHub Copilot

[Comment](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for neovim

[lazy](https://github.com/folke/lazy.nvim) - Plugin manager

[lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) - Bundle for CMP and LSP

[lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim statusline written in Lua

[mason-null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Bridges mason.nvim with the null-ls plugin.

[mini.files](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-files.md) - File explorer

[nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) - Color highlighter

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support.

[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - A Lua fork of vim-devicons

[null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

[telescope](https://github.com/nvim-treesitter/nvim-treesitter) - Highly extendable fuzzy finder over lists

## Requirements

**general**

- [neovim](https://github.com/neovim/neovim) - 0.9.5 version

**telescope**

- [ripgrep](https://github.com/BurntSushi/ripgrep) - line-oriented search tool (Telescope dependency)

## Installation

1. Install requirements

2. Clone [this repository](https://github.com/mifka01/nvim) with `git`

```term
git clone https://github.com/mifka01/nvim.git ~/.config/nvim
```

## Directory Tree

```
├── lua/user
│   ├── lsp
│   │   ├── init.lua
│   │   └── null-ls.lua
│   ├── autopairs.lua
│   ├── cinnamon.lua
│   ├── colorizer.lua
│   ├── colorscheme.lua
│   ├── comment.lua
│   ├── files.lua
│   ├── keymaps.lua
│   ├── lualine.lua
│   ├── options.lua
│   ├── plugins.lua
│   ├── telescope.lua
│   ├── treesitter.lua
└── init.lua
```

## Appearance

**Colorscheme:** [no-clown-fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## License

[MIT](https://choosealicense.com/licenses/mit/)
