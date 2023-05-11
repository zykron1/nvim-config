vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'nordtheme/vim'
  use 'rstacruz/vim-closer'
  use 'jiangmiao/auto-pairs'
  use 'glepnir/dashboard-nvim'
  use 'nvim-treesitter/nvim-treesitter'
  -- Dap
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'

  --Genereal
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
}
end)
-- Setups
require("nvim-tree").setup()
require('lualine').setup()
require("bufferline").setup({options = {
	separator_style = "slope",
	diagnostics = "nvim_lsp",
	hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
        }
}})
local lsp = require('lsp-zero').preset("recommended")
lsp.setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dapui').setup()
local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', {text='⭕', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='', numhl=''})
vim.cmd("set clipboard+=unnamed")

-- Set up the look
vim.cmd("colorscheme nord")
vim.cmd("colorscheme tokyonight-night")
vim.cmd("set number")
vim.cmd("NvimTreeToggle")

-- Key remaps
local builtin = require('telescope.builtin')
vim.cmd("let mapleader = ' '")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.cmd("nnoremap <TAB> :BufferLineCycleNext<CR>")
vim.cmd("nnoremap <S-TAB> :BufferLineCyclePrev<CR>")
vim.cmd("nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>")
vim.cmd("nnoremap <C-d> :lua require'dap'.continue()<CR>")
vim.cmd("nnoremap <C-s> :lua require'dapui'.open()<CR>")
vim.cmd("nnoremap <C-q> :lua require'dapui'.close()<CR>")
