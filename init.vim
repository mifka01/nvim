lua require('plug_init')

lua require('plugins/nvim-treesitter')
lua require('plugins/nvim-web-devicons')
lua require('plugins/nvim-cmp')
lua require('plugins/nvim-lsp-installer')
lua require('plugins/trouble')
lua require('plugins/nvim-lualine')

# Uncomment for discord rich presence (https://github.com/andweeb/presence.nvim)
# Change configuration in lua/plugins/presence.lua
#lua require('plugins/presence')

lua require('core/keymaps')


"UI Options
set number
set noerrorbells
set title
set clipboard=unnamedplus

"Lightline
set laststatus=2
set noshowmode

"Text Rendering Options
set encoding=utf-8
set linebreak
set completeopt=menu,menuone,noselect
syntax enable

"Indention Options
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set fixeol

"Search Options
set hlsearch
set ignorecase
set incsearch
set smartcase

"Colors
colorscheme gruvbox
set termguicolors

