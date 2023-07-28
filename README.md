# Neovim configuration with Lua

This config is based on [neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) and [primeagen-init](https://github.com/ThePrimeagen/init.lua) repos.

## Plugins

[packer](https://github.com/wbthomason/packer.nvim) - Plugin manager

[autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopair plugin for Neovim.

[lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) - Bundle for CMP and LSP

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer For Neovim Written In Lua

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

[mason-null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Bridges mason.nvim with the null-ls plugin.

[telescope](https://github.com/nvim-treesitter/nvim-treesitter) - Highly extendable fuzzy finder over lists

[lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim statusline written in Lua

[rose-pine](https://github.com/rose-pine/neovim) - Colorscheme

[Comment](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for neovim

[vim-smoothie](https://github.com/psliwka/vim-smoothie) - Plugin makes scrolling nice and smooth.

[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Better folding

[statuscol](https://github.com/luukvbaal/statuscol.nvim) - Hide folding numbers (for ufo)

## Requirements

**general**

- [neovim](https://github.com/neovim/neovim) - 0.9.1 version

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
│   ├── colorscheme.lua
│   ├── comment.lua
│   ├── keymaps.lua
│   ├── lualine.lua
│   ├── nvim-tree.lua
│   ├── options.lua
│   ├── plugins.lua
│   ├── telescope.lua
│   ├── treesitter.lua
│   └── ufo.lua
└── init.lua
```

## Appearance

**Colorscheme:** [rose-pine](https://github.com/rose-pine/neovim)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## License

[MIT](https://choosealicense.com/licenses/mit/)
