filetype plugin on

runtime ./sets.vim

call plug#begin ('~/.vim/plugged')       
 Plug 'simeji/winresizer'
 Plug 'kdheepak/lazygit.nvim'
 Plug 'mhinz/vim-startify'
 Plug 'tpope/vim-commentary'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'neoclide/coc.nvim', {'branch':'release'}
 Plug 'gruvbox-community/gruvbox'
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'nvim-lualine/lualine.nvim'
 " Plug 'junegunn/fzf', {'do' : 'fzf#install'}  
 " post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
   \ 'do': 'yarn install --frozen-lockfile --production'}
call plug#end()
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
colorscheme gruvbox

let mapleader = " "
runtime ./maps.vim
runtime ./plugin/coc.vim
runtime ./plugin/lualine.vim
set guifont=Hack_Nerd_Font_Mono:h16  
" runtime ./plugin/nvim-lualine.vim
" runtime ./plugin/nvim-lualine-cfgs/slanted-gaps.lua
" function! s:gitModified()
    " let files = systemlist('git ls-files -m 2>/dev/null')
    " return map(files, "{'line': v:val, 'path': v:val}")
" endfunction

" " same as above, but show untracked files, honouring .gitignore
" function! s:gitUntracked()
"     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
" endfunction

" let g:startify_lists = [
"         \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
"         \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
"         \ { 'type': 'sessions',  'header': ['   Sessions']       },
"         \ { 'type': 'files',     'header': ['   Files']            },
"         \ { 'type': 'dir',       'header': ['   Current '. getcwd()] },
"         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"         \ { 'type': 'commands',  'header': ['   Commands']       },
"         \ ]
