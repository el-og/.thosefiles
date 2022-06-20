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
 " Plug 'folke/tokyonight.nvim', {'branch':'main'}
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'nvim-treesitter/nvim-treesitter' 
 Plug 'nvim-treesitter/nvim-treesitter-angular'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'voldikss/vim-floaterm'
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
 " Plug 'neoclide/vim-jsx-improve'
 Plug 'mbbill/undotree'
 Plug 'tpope/vim-surround'
 Plug 'f-person/git-blame.nvim'
 " Plug 'prettier/vim-prettier', {  'do': 'yarn install --frozen-lockfile --production'}
 Plug 'jparise/vim-graphql'
 Plug 'christoomey/vim-system-copy'
 Plug 'lukas-reineke/indent-blankline.nvim'
 " Plug 'machakann/vim-highlightedyank'
 " Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
 " Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile && yarn build'}
 Plug 'rcarriga/nvim-notify'
 " Plug 'shuntaka9576/preview-swagger.nvim'
 " Plug 'neoclide/jsonc.vim'
call plug#end()
colorscheme gruvbox
highlight Normal guibg=none
" colorscheme tokyonight
" let g:highlightedyank_highlight_duration = 300

let mapleader = " "
runtime ./maps.vim
runtime ./plugin/coc.vim
" runtime ./plugin/lualine.vim
" set guifont=Hack_Nerd_Font_Mono:h16  

set guicursor+=a:-Cursor-blinkwait175-blinkoff150-blinkon175

" let g:coc_node_path= '/Users/oskarasg/.nvm/versions/node/v12.17.0/bin/node'
set splitright
let g:floaterm_height=0.85
let g:floaterm_width=0.85

" let g:coc_filetype_map = {
"             \ 'javascript.jsx': 'javascriptreact'
"             \  }

autocmd VimEnter * :GitBlameDisable

autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-angular')
autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-tsserver')
autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-css')
" autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-html')
autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-json')
autocmd VimEnter * call CocActionAsync('activeExtension', 'coc-prettier')

" Highlight active line
set cursorline
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})
augroup END

" vim.notify = require("notify")
" local plugin = "Error Information"
" vim.notify(data)
"
"

    " echo a:variable
lua << EOF
function check_errors(info)
    vim.notify = require("notify")
    vim.notify(info)
    --vim.api.nvim_command('echo ' .. info)
end
EOF

" command! Blah lua require check_errors()


" func! Test()

" lua << EOF
" vim.notify = require("notify")
"  local plugin = "My Awesome Plugin"
"  vim.notify("This is an error message.\nSomething went wrong!", "error", {
"    title = plugin,
"    on_open = function()
"      vim.notify(data, vim.lsp.log_levels.WARN, {
"        title = plugin,
"      })
"      local timer = vim.loop.new_timer()
"      timer:start(2000, 0, function()
"        vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
"          title = plugin,
"          timeout = 3000,
"          on_close = function()
"            vim.notify("Problem solved", nil, { title = plugin })
"            vim.notify("Error code 0x0395AF", 1, { title = plugin })
"          end,
"        })
"      end)
"    end,
"  })
" EOF
" endfu

" " set to node path
" " default "node" command in $PATH
" let g:pswag_node_path = '/Users/oskarasg/.nvm/versions/node/v16.14.2/bin/node'

" " set to lunch port
" " default 9126
" let g:pswag_lunch_port='6060'

" " set to lunch address
" " default 127.0.0.1
" let g:pswag_lunch_ip='127.0.0.1'
