-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Git 
  use("tpope/vim-fugitive")

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

  -- Barbar tabs
  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

  -- telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
	  
  -- Catoouccin theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Copilot
  use("github/copilot.vim")

  -- Status line
  use({
	  'glepnir/galaxyline.nvim',
	  branch = 'main',
	  -- your statusline
	  config = function()
		  require('my_statusline')
	  end,
	  -- some optional icons
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })

  -- DAP
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use("ldelossa/nvim-dap-projects")
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")
  use('leoluz/nvim-dap-go')

  -- Integration with tmux
  use({
      "aserowy/tmux.nvim",
      config = function() return require("tmux").setup() end
  })

  -- Terragrunt
  use("yorinasub17/vim-terragrunt")

  -- Database access
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-ui")

  -- Refactoring
  use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
      }
  }

  -- ChatGPT
  use({
      "jackMort/ChatGPT.nvim",
      requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
      }
  })

  -- ChatGPT - Gp.nvim
  use({
      "robitx/gp.nvim",
      config = function()
          require("gp").setup()

          -- or setup with your own config (see Install > Configuration in Readme)
          -- require("gp").setup(conf)

          -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
      end,
  })

  use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }
  use 'simrat39/rust-tools.nvim'

  -- Markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Visual mode multi selection/edit like vscode
  use { "mg979/vim-visual-multi", branch = "master" }

  -- Graphql
  use { "jparise/vim-graphql" }

  -- Nvim surround - surround text with brackets, quotes, etc
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  -- TreeSJ - expand/collapse treesitter nodes
  use({
      'Wansmer/treesj',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
          require('treesj').setup({--[[ your config ]]})
      end,
  })

  -- BQF - Quick Fix Window
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  -- optional
  use {'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
    end
  }

  -- GITBlame
  use {'f-person/git-blame.nvim' }

  -- Lazygint
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  -- Diff view
  use "sindrets/diffview.nvim"

  use({
      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
          require("dir-telescope").setup({
              -- these are the default options set
              hidden = true,
              no_ignore = false,
              show_preview = true,
          })
      end,
  })

  -- FloaTerm
  use 'voldikss/vim-floaterm'

  -- Dash-nvim
  use({
      'mrjones2014/dash.nvim',
      run = 'make install',
  })

  -- GFold - make sure to install from https://github.com/nickgerace/gfold
  use {
      "npenkov/nvim-gfold.lua",
      branch = "feature/unpulled",
      config = function()
          require('gfold').setup()
      end,
  }

  -- Replace vim select with telescope
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- GH-Line - Open GitHub, GitLab, etc
  use { 'ruanyl/vim-gh-line' }

  -- Vim-todo
  use { 'Dimercel/todo-vim' } 

end)
