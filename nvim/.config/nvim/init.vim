filetype plugin on

runtime ./sets.vim

call plug#begin ('~/.vim/plugged')       
 Plug 'simeji/winresizer'
 Plug 'kdheepak/lazygit.nvim'
 Plug 'mhinz/vim-startify'
 Plug 'tpope/vim-commentary'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'ThePrimeagen/harpoon'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'neoclide/coc.nvim', {'branch':'release'}
 Plug 'gruvbox-community/gruvbox'
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'nvim-treesitter/nvim-treesitter' 
 Plug 'nvim-treesitter/nvim-treesitter-angular'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'voldikss/vim-floaterm'
 " Plug 'neoclide/vim-jsx-improve'
 Plug 'mbbill/undotree'
 Plug 'tpope/vim-surround'
 " Plug 'f-person/git-blame.nvim'
 Plug 'prettier/vim-prettier', {  'do': 'yarn install --frozen-lockfile --production'}
call plug#end()
colorscheme gruvbox

let mapleader = " "
runtime ./maps.vim
runtime ./plugin/coc.vim
" runtime ./plugin/lualine.vim
set guifont=Hack_Nerd_Font_Mono:h16  

" let g:coc_node_path= '/Users/oskarasg/.nvm/versions/node/v12.17.0/bin/node'

let g:floaterm_height=0.85
let g:floaterm_width=0.85

let g:coc_filetype_map = {
            \ 'javascript.jsx': 'javascriptreact'
            \  }
