require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nordtheme/vim'
  use 'rstacruz/vim-closer'
  use 'jiangmiao/auto-pairs'
  use 'glepnir/dashboard-nvim'
  use 'lewis6991/gitsigns.nvim'
  use "folke/trouble.nvim"
  use {"akinsho/toggleterm.nvim", tag = '*'}
  use 'thedenisnikulin/vim-cyberpunk'
  use "lukas-reineke/indent-blankline.nvim"
  use "nvim-neotest/nvim-nio"
  use "notken12/base46-colors"
  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
	api_key_cmd = "echo $OPENAI_KEY",
        openai_params = {
          model = "llama3-8b-8192",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        }
    })
  end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  -- Dap
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'tiagovla/tokyodark.nvim'

  --Genereal
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-treesitter/nvim-treesitter'
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
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-tree/nvim-tree.lua'
end)
-- Setups
require('ibl').setup({
  indent = {
    char = '▏',
  },
  scope = {
    show_start = false,
    show_end = false,
  },
})
require("nvim-tree").setup()
require('lualine').setup()
require("bufferline").setup {
    options = {
	separator_style = "thick",
	diagnostics = "nvim_lsp",
        mode = 'buffers',
	hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        },
    },
}

require ('nvim-treesitter.configs').setup ({
  ensure_installed = { "c", "lua", "python", "javascript", "html", "css" },
  auto_install = true,

  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "ss", -- set to `false` to disable one of the mappings
      node_incremental = "si",
      scope_incremental = "sc",
      node_decremental = "sd",
    },
  },
})

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
require('dap-python').setup('/Library/Frameworks/Python.framework/Versions/3.10/bin/python3')
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
        desc = 'Find File',
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
vim.cmd("colorscheme yoru")
vim.cmd("set number")
vim.cmd("NvimTreeOpen")
vim.cmd("set shiftwidth=4 smarttab")

-- Key remaps
local builtin = require('telescope.builtin')
vim.cmd("let mapleader = ' '")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.g.shiftwidth = 4
vim.cmd("nnoremap <TAB> :BufferLineCycleNext<CR>")
vim.cmd("nnoremap <S-TAB> :BufferLineCyclePrev<CR>")
vim.cmd("nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>")
vim.cmd("nnoremap <C-o> :cclose<CR>")
vim.cmd("nnoremap <C-d> :lua require'dap'.continue();require'dapui'.open(); vim.cmd[[NvimTreeClose]]<CR>")
vim.cmd("nnoremap <C-q> :lua require'dapui'.close(); require'dap'.close();vim.cmd[[NvimTreeOpen]]<CR>")
vim.cmd("nnoremap <C-t> :ToggleTerm<CR>")
vim.cmd("nnoremap <C-j> :ToggleTerm<CR>")
