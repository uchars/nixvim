local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'stevearc/oil.nvim',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      {
        'ray-x/lsp_signature.nvim',
        event = 'VeryLazy',
      },
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
      },
      'folke/neodev.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
    },
  },

  {
    'lewis6991/gitsigns.nvim',
  },

  {
    'navarasu/onedark.nvim',
    priority = 1000,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
  },

  {
    'numToStr/Comment.nvim',
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'octarect/telescope-menu.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'ThePrimeagen/git-worktree.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
  },
}
