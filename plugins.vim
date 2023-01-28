call plug#begin()

"Plugins
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)

"NerdTree setup
Plug 'https://github.com/preservim/nerdtree' "NerdTree
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'"Syntax for NerdTree

"General
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/joshdick/onedark.vim' "Color Theme 1
Plug 'https://github.com/ghifarit53/tokyonight-vim' "Color Theme 2
Plug 'https://github.com/Mofiqul/vscode.nvim' "Color Theme 3
Plug 'https://github.com/doums/darcula' "Color Theme 4
Plug 'https://github.com/morhetz/gruvbox' "Color Theme 5
Plug 'https://github.com/sainnhe/sonokai' "Color Theme 6
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' "Varibles and project structure
"Neovim built in lsp support
" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

Plug 'https://github.com/ryanoasis/vim-devicons' "Icons
Plug 'https://github.com/jiangmiao/auto-pairs' "autoclose pairs
Plug 'https://github.com/glepnir/dashboard-nvim' "dashboard-nvim
Plug 'https://github.com/rcarriga/nvim-notify' "notifications
Plug 'https://github.com/akinsho/toggleterm.nvim' "terminal
Plug 'https://github.com/lewis6991/gitsigns.nvim' "gitsigns
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/mattn/emmet-vim'

"teliscope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
"Treesitter
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"fzf
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/airblade/vim-rooter'

"nvim-dap
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'https://github.com/mfussenegger/nvim-dap-python'
Plug 'https://github.com/theHamsta/nvim-dap-virtual-text'

set encoding=UTF-8

call plug#end()
