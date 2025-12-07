# Neovim configuration with Lua

This config is based on [kickstart](https://github.com/nvim-lua/kickstart.nvim/) and [tjdevries-config](https://github.com/tjdevries/config.nvim).
It's focused on PHP/Symfony development, but it has support for other languages as well.
In section [Stuff you might want to disable](#stuff-you-might-want-to-disable) you can find instructions how to disable PHP/Symfony specific stuff.


## Requirements

**general**

- [neovim](https://github.com/neovim/neovim) - 0.11.5

**snacks picker**

- [ripgrep](https://github.com/BurntSushi/ripgrep) - line-oriented search tool

**lspconfig**

- [lua-language-server](https://github.com/LuaLS/lua-language-server) - Lua language server
- [stylua](https://github.com/JohnnyMorganz/StyLua) - Lua code formatter
- [intelephense](https://intelephense.com/) - PHP language server
- [vimfony](https://github.com/shinyvision/vimfony) - Symfony support for Neovim/Vim.

Those can be installed via your package manager or [mason.nvim](https://github.com/mason-org/mason.nvim) if you prefer that.
I prefer to install those few via package manager, because I use NixOS and it's easier for me to manage those that way.

Mason is already included in this config and is installing some tools automatically. you can check `:Mason` or `lua/custom/lsp.lua` file to see which tools are installed via Mason.

Vimfony is in pretty early stage, so not all features may work as expected in this config.

## Stuff you might want to disable
If you don't use PHP/Symfony development, you might want to disable vimfony, intelephense LSP, PHP-CS-FIXER or phpstan diagnostics.

Vimfony can be disabled in `lua/custom/lsp.lua` file by commenting out or removing following lines:

```lua
require("custom.lsp.vimfony")
```

Intelephense LSP can be disabled in `lua/custom/lsp.lua` file by removing it from servers list:

```lua
local servers = {
    ...
	intelephense = {
		settings = {
			intelephense = {
				files = {
					exclude = workspace.get_vendor_excludes(),
				},
			},
		},
	},
    ...
}
```

PHP-CS-Fixer can be disabled by removing it from `lua/custom/lsp.lua` file in [conform]()`formatters` section:

```lua

PHPStan diagnostics can be disabled by deleting ale plugin configuration file `lua/custom/plugins/ale.lua`.


## Installation

1. Install requirements

2. Clone [this repository](https://github.com/mifka01/nvim) with `git`

```term
git clone https://github.com/mifka01/nvim.git ~/.config/nvim
```

## Appearance

**Colorscheme:** [vim-moonfly-colors](https://github.com/aktersnurra/no-clown-fiesta.nvim)

## License

[MIT](https://choosealicense.com/licenses/mit/)
