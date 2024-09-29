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

require('nvim-treesitter.configs').setup({
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
	direction = "vertical",
	float_opts = {
		border = "double",
	},
})
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

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
