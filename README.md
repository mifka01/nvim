# Neovim configuration with Lua

## Plugins

[vim-plug](https://github.com/junegunn/vim-plug) -  A minimalist Vim plugin manager

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client

[williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - Neovim plugin that allows you to seamlessly install LSP servers locally

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua

[vim-vsnip](https://github.com/hrsh7th/vim-vsnip) - VSCode(LSP)'s snippet feature in vim

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[telescope.nvim](https://github.com/nvim-treesitter/nvim-treesitter) - Highly extendable fuzzy finder over lists

[trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty list for showing diagnostics etc.

[vista.vim](https://github.com/liuchengxu/vista.vim) - View and search LSP symbols and tags

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[presence.vim](https://github.com/andweeb/presence.nvim) - Discord Rich Presence

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Neovim statusline written in Lua

[gruvbox](https://github.com/morhetz/gruvbox) - Colorscheme

## Requirements

- [neovim](https://github.com/neovim/neovim) - Stable version
- [ripgrep](https://github.com/BurntSushi/ripgrep) - line-oriented search tool (Telescope dependency)
- [vim-plug](https://github.com/junegunn/vim-plug) - Plugin manager
- [universal-ctags](https://github.com/universal-ctags/ctags) - Vista requirement

## Installation

1. Install requirements

2. Clone [this repository](https://github.com/mifka01/nvim) with `git`

```term
git clone https://github.com/mifka01/nvim.git ~/.config/nvim
```
<details><summary>Unix path</summary>
      ~/.config/nvim/
</details>

<details><summary>Win path</summary>
      ~/AppData/Local/nvim/
</details>

3. Open Neovim and run `:PlugInstall` command

4. Install languages using [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)



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
│   │   ├── presence.lua
│   │   └── trouble.lua
│   └── plug_init.lua
└── init.vim
```

## Appearance

**Colorscheme:** [gruvbox](https://github.com/morhetz/gruvbox)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## License
[MIT](https://choosealicense.com/licenses/mit/)

