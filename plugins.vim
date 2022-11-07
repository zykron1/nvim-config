call plug#begin()

"Plugins
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)

"NerdTree setup
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree syntax highlighting

"General
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/joshdick/onedark.vim' "Color Theme 1
Plug 'https://github.com/ghifarit53/tokyonight-vim' "Color Theme 2
Plug 'https://github.com/Mofiqul/vscode.nvim' "Color Theme 3
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' "Varibles and project structure
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' "Icons
Plug 'https://github.com/jiangmiao/auto-pairs' "autoclose pairs
Plug 'https://github.com/glepnir/dashboard-nvim' "dashboard-nvim
Plug 'https://github.com/rcarriga/nvim-notify' "notifications
Plug 'https://github.com/akinsho/toggleterm.nvim' "terminal
Plug 'https://github.com/lewis6991/gitsigns.nvim' "gitsigns

"Plug 'https://github.com/romgrk/barbar.nvim'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'

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
