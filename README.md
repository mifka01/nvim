# Neovim configuration with Lua

## Plugins

[vim-plug](https://github.com/junegunn/vim-plug) -  A minimalist Vim plugin manager

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client

[williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - Neovim plugin that allows you to seamlessly install LSP servers locally

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua

[vim-vsnip](https://github.com/hrsh7th/vim-vsnip) - VSCode(LSP)'s snippet feature in vim.

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[telescope.nvim](https://github.com/nvim-treesitter/nvim-treesitter) - Highly extendable fuzzy finder over lists

[trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty list for showing diagnostics etc.

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[gruvbox](https://github.com/morhetz/gruvbox) - Colorscheme


## Directory Tree

```
├── lua
│   ├── core
│   │   └── keymaps.lua
│   ├── plugins
│   │   ├── nvim-cmp.lua
│   │   ├── nvim-lsp-installer.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── nvim-web-devicons.lua
│   │   └── trouble.lua
│   └── plug_init.lua
└── init.vim
```

## Appearance

**Colorscheme:** [gruvbox](https://github.com/morhetz/gruvbox)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
