local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "stevearc/oil.nvim",
    tag = "stable",
  },
  "tpope/vim-surround",

  -- Git related plugins
  "tpope/vim-fugitive",

  "nvim-tree/nvim-web-devicons",
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  { "xiyaowong/transparent.nvim", commit = "fd35a46" },

  { "kkoomen/vim-doge" },
  {
    "neovim/nvim-lspconfig",
    tag = "v0.1.8",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
        tag = "v1.10.0",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        tag = "v1.29.0",
      },
      {
        "jay-babu/mason-null-ls.nvim",
        tag = "v2.6.0",
      },
      "jose-elias-alvarez/null-ls.nvim",
      {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
      },
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
      },
      "folke/neodev.nvim",
      {
        "folke/trouble.nvim",
        cmd = "Trouble",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    commit = "a110e12",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    tag = "release",
  },

  "navarasu/onedark.nvim",
  "folke/tokyonight.nvim",

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },

  {
    "numToStr/Comment.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "octarect/telescope-menu.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      "ThePrimeagen/git-worktree.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
  },

  "ThePrimeagen/harpoon",
  "mbbill/undotree",
})
