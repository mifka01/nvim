# Neovim configuration with Lua

This config is based on awesome [neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) repository.

## Plugins

[packer](https://github.com/wbthomason/packer.nvim) - Plugin manager

[autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopair plugin for Neovim.

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer For Neovim Written In Lua

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snipper engine

[friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection for a set of different programming languages

[null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

[telescope](https://github.com/nvim-treesitter/nvim-treesitter) - Highly extendable fuzzy finder over lists

[lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim statusline written in Lua

[gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua.

[sunbather](https://github.com/nikolvs/vim-sunbather) - Colorscheme

[Comment](https://github.com/numToStr/Comment.nvim) - Smart and Powerful commenting plugin for neovim

[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - A Neovim plugin for setting the commentstring option

[impatient](https://github.com/lewis6991/impatient.nvim) - Speed up loading Lua modules in Neovim to improve startup time.

[vim-smoothie](https://github.com/psliwka/vim-smoothie) - Plugin makes scrolling nice and smooth.

## Requirements

**general**

- [neovim](https://github.com/neovim/neovim) - Nightly version

**telescope**

- [ripgrep](https://github.com/BurntSushi/ripgrep) - line-oriented search tool (Telescope dependency)

**null-ls**

- [flake8](https://flake8.pycqa.org/en/latest/) - Python code linter
- [autopep8](https://github.com/hhatto/autopep8) - Python code formatter
- [prettier](https://github.com/prettier/prettier) - Opinionated Code Formatte
- [phpcbf](https://github.com/squizlabs/PHP_CodeSniffer) - PHP Code sniffer
- [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)- PHP Coding Standards Fixer
- [isort](https://github.com/pycqa/isort/) - Python utility to sort imports alphabetically

## Installation

1. Install requirements

2. Clone [this repository](https://github.com/mifka01/nvim) with `git`

```term
git clone https://github.com/mifka01/nvim.git ~/.config/nvim
```

## Directory Tree

```
├── lua
│   ├── user
│   │   ├── lsp
│   │   │   ├── settings
│   │   │   │   ├── jsonls.lua
│   │   │   │   ├── pyright.lua
│   │   │   │   └── sumneko_lua.lua
│   │   │   ├── configs.lua
│   │   │   ├── handlers.lua
│   │   │   ├── init.lua
│   │   │   └── null-ls.lua
│   │   ├── autopairs.lua
│   │   ├── cmp.lua
│   │   ├── colorscheme.lua
│   │   ├── comment.lua
│   │   ├── gitsigns.lua
│   │   ├── impatient.lua
│   │   ├── keymaps.lua
│   │   ├── lualine.lua
│   │   ├── nvim-tree.lua
│   │   ├── options.lua
│   │   ├── plugins.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   └── plug_init.lua
└── init.lua
```

## Appearance

**Colorscheme:** [sunbather](https://github.com/nikolvs/vim-sunbather)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## License

[MIT](https://choosealicense.com/licenses/mit/)
