vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'nordtheme/vim'
  use 'rstacruz/vim-closer'
  use 'jiangmiao/auto-pairs'
  use 'glepnir/dashboard-nvim'
  use 'lewis6991/gitsigns.nvim'
  use "folke/trouble.nvim"
  use {"akinsho/toggleterm.nvim", tag = '*'}
  use 'thedenisnikulin/vim-cyberpunk'
  -- Dap
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'tiagovla/tokyodark.nvim'

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
  use 'nvim-tree/nvim-tree.lua'
end)
-- Setups
require("nvim-tree").setup()
require('lualine').setup()
require("bufferline").setup({options = {
	separator_style = "thick",
	diagnostics = "nvim_lsp",
	hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
        }
}})
local lsp = require('lsp-zero').preset("recommended")
lsp.setup()
vim.diagnostic.config({})
local cmp = require('cmp')

local icons = {
  Text = "",
  Variable = "",
  Snippet = "",
  Module = "",
  Class = "",
  Keyword = "",
  Function = "󰊕",
  Method = "󰊕"
}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      border = "double",
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuThumb,Search:None"
    }),
  },

  formatting = {
    fields = {"abbr", "kind"},
    format = function (_, vim_item)
      vim_item.kind = (icons[vim_item.kind] or "?") .. " " .. vim_item.kind
      return vim_item
    end,
  },

  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dapui').setup()
vim.fn.sign_define('DapBreakpoint', {text='⭕', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='', numhl=''})
vim.cmd("set clipboard+=unnamed")
require("toggleterm").setup()
require("gitsigns").setup()

local db = require("dashboard")
db.setup({
  theme = 'doom',
  config = {
    header = {}, --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'lua print(2)'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
        keymap = 'SPC f d',
        action = 'lua print(3)'
      },
    },
    footer = {}  --your footer
  }
})


-- Set up the look
vim.cmd("colorscheme nord")
vim.cmd("colorscheme tokyonight-night")
vim.cmd("set number")
vim.cmd("NvimTreeOpen")

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
vim.cmd("nnoremap <C-o> :cclose<CR>")
vim.cmd("nnoremap <C-d> :lua require'dap'.continue();require'dapui'.open(); vim.cmd[[NvimTreeClose]]<CR>")
vim.cmd("nnoremap <C-q> :lua require'dapui'.close(); require'dap'.close();vim.cmd[[NvimTreeOpen]]<CR>")
vim.cmd("nnoremap <C-t> :ToggleTerm<CR>")
vim.cmd("nnoremap <C-f> :set shiftwidth=4<CR>")
