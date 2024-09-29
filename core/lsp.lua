-- Setup for lsp-zero
local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				on_attach = lsp_attach,
			})
		end,
	},
})

require("lspconfig").pyright.setup({
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("setup.py", "setup.cfg", "pyproject.toml", ".git")(fname) or vim.fn.getcwd()
	end,
})

vim.diagnostic.config({})

-- Setup cmp with lsp-zero
local icons = {
	Text = "",
	Variable = "",
	Snippet = "",
	Module = "",
	Class = "",
	Keyword = "",
	Function = "󰊕",
	Method = "󰊕",
	Codeium = "🤖",
	Field = "",
	Interface = "",
	Constant = "",
	Property = "",
}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

local cmp = require('cmp')

cmp.setup({
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuThumb,Search:None"
		}),
		documentation = cmp.config.window.bordered({
			border = border "CmpDocBorder",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuThumb,Search:None"
		}),
	},

	formatting = {
		fields = {"abbr", "kind"},
		format = function(_, vim_item)
			vim_item.kind = (icons[vim_item.kind] or "?") .. " " .. vim_item.kind
			return vim_item
		end,
	},

	sources = {
		{ name = "codeium", max_item_count = 20 },
		{ name = 'nvim_lsp', max_item_count = 20 },
	},

	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'insert' })
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

-- Setup dap
require('dapui').setup()
vim.fn.sign_define('DapBreakpoint', { text = '⭕', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '→', texthl = '', linehl = '', numhl = '' })
require('dap-python').setup('/Library/Frameworks/Python.framework/Versions/3.12/bin/python3')
vim.cmd("set clipboard+=unnamed")
