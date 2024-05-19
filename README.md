# Neovim configuration with Lua

This config is based on [kickstart](https://github.com/nvim-lua/kickstart.nvim/) and [tjdevries-config](https://github.com/tjdevries/config.nvim).

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
├── lua/custom
│   ├── plugins
│   │   ├── Comment.lua
│   │   ├── Copilot.lua
│   │   ├── autopairs.lua
│   │   ├── cmp.lua
│   │   ├── colorizer.lua
│   │   ├── colorscheme.lua
│   │   ├── hardtime.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── mini.lua
│   │   ├── oil.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   ├── cmp.lua
│   ├── lsp.lua
│   ├── lualine.lua
│   └── telescope.lua
├── plugin
│   ├── keymaps.lua 
│   └── options.lua
└── init.lua
```

## Appearance

**Colorscheme:** [no-clown-fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## License

[MIT](https://choosealicense.com/licenses/mit/)
