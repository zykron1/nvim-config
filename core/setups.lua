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
		indicator = {
			icon = '▎',
			style = 'underline'
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
	  init_selection = "ss", -- set to false to disable one of the mappings
	  node_incremental = "si",
	  scope_incremental = "sc",
	  node_decremental = "sd",
	},
  },
})

require("toggleterm").setup({
	direction = "float",
	float_opts = {
		border = "double",
	},
})

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
