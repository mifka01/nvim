# Neovim Configuration (Lua)

A personal Neovim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/) and [tjdevries/config.nvim](https://github.com/tjdevries/config.nvim), focused on PHP/Symfony while still supporting other languages.

## What This Config Includes

- Modern LSP setup (Neovim built-in LSP + `nvim-lspconfig`)
- Completion with `blink.cmp`
- Format-on-save with `conform.nvim`
- PHP linting with `nvim-lint` + PHPStan wrapper
- File search/explorer via `snacks.nvim` and `oil.nvim`
- Treesitter highlighting
- Git tools (`gitsigns.nvim`, `vim-fugitive`)
- Utilities like `todo-comments`, `undotree`, `Comment.nvim`, `nvim-autopairs`

## Language Support

This setup is primarily tuned for PHP/Symfony and also includes support for:

- Lua
- JavaScript / TypeScript
- Python
- Bash
- C / C++
- Twig
- YAML

## Requirements

### Core

- [neovim](https://github.com/neovim/neovim) `>= 0.11.5`
- [git](https://git-scm.com/)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (used by pickers)

### Language Servers

- [lua-language-server](https://github.com/LuaLS/lua-language-server)
- [intelephense](https://intelephense.com/)
- [pyright](https://github.com/microsoft/pyright)
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) (`ts_ls`)
- [bash-language-server](https://github.com/bash-lsp/bash-language-server) (`bashls`)
- [clangd](https://clangd.llvm.org/)
- [twiggy_language_server](https://github.com/moetelo/twiggy)
- [vimfony](https://github.com/shinyvision/vimfony)

### Formatters

- [stylua](https://github.com/JohnnyMorganz/StyLua)
- [php-cs-fixer](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer)
- [prettier](https://prettier.io/)
- [black](https://github.com/psf/black)
- [isort](https://github.com/PyCQA/isort)
- [clang-format](https://clang.llvm.org/docs/ClangFormat.html)

### Linting

- [phpstan](https://phpstan.org/) (invoked through a local `./run` wrapper in project folders)

> This config does **not** use [mason.nvim](https://github.com/mason-org/mason.nvim).
> Install language servers, formatters, and linters yourself via package manager / npm / pip.

## Installation

1. Install all requirements from above.
2. Clone this repository:

```bash
git clone https://github.com/mifka01/nvim.git ~/.config/nvim
```

3. Start Neovim. Plugins will be managed by `lazy.nvim`.
4. Recommended first checks inside Neovim:
   - `:Lazy`
   - `:checkhealth`
   - `:LspInfo`

## PHP/Symfony-Specific Features

- `vimfony` integration for Symfony projects
- `intelephense` configured with workspace-aware root and vendor exclusions
- Twig LSP (`twiggy_language_server`) enabled
- PHP formatting via `php-cs-fixer`
- PHP diagnostics via PHPStan on save (`nvim-lint`)

## Optional: Disable PHP/Symfony-Specific Parts

If you do not use PHP/Symfony, you can disable these pieces.

### Disable Vimfony LSP

In `lua/custom/lsp.lua`, remove:

```lua
require("custom.lsp.vimfony")
```

### Disable Intelephense and Twiggy LSP

In `lua/custom/lsp.lua`, remove these entries from the `servers` table:

- `intelephense`
- `twiggy_language_server`

### Disable PHP formatter

In `lua/custom/lsp.lua`, remove:

- `php = { "php_cs_fixer" }` from `formatters_by_ft`
- `php_cs_fixer` from `formatters`

### Disable PHPStan lint diagnostics

In `lua/custom/plugins/lint.lua`, remove PHP lint setup (`phpstan`) or disable the plugin spec.

## Useful Keymaps (Highlights)

- `<leader>ff` smart file finder
- `<leader>fg` grep search
- `<leader>E` explorer
- `<leader>e` open parent directory (Oil)
- `<leader>gb` git blame line
- `<leader>gh` file git history
- `<leader>ut` toggle undotree

## Appearance

- Colorscheme: [vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)

## License

[MIT](https://choosealicense.com/licenses/mit/)
