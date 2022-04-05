-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter


require('nvim-treesitter.configs').setup {
  ensure_installed = {'php', 'bash', 'c','css','html','lua','json','javascript'},
  highlight = {
    enable = true,
  },
}

