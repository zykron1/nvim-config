require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nordtheme/vim'
  use 'rstacruz/vim-closer'
  use 'jiangmiao/auto-pairs'
  use 'glepnir/dashboard-nvim'
  use 'lewis6991/gitsigns.nvim'
  use "folke/trouble.nvim"
  use "ThePrimeagen/harpoon"
  use {"akinsho/toggleterm.nvim", tag = '*'}
  use 'thedenisnikulin/vim-cyberpunk'
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-neotest/nvim-nio"
  use "zykron1/base46-colors"

  -- Dap
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'tiagovla/tokyodark.nvim'

  --Genereal
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-treesitter/nvim-treesitter'

  --lsp
  use {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/nvim-cmp'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
end)
