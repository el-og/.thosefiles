" nnoremap  <silent><leader>ff <cmd>:lua require('telescope.builtin').find_files()<cr> 
" nnoremap  <silent><leader>fg :lua require('telescope.builtin').live_grep()<cr> 

nnoremap <silent><leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep hidden=true<cr>

nnoremap <leader>dt :silent exec '! tmux display-popup -h 90\% -w 90\% -E "tmux attach -d -t nvim_popup \|\| tmux new -s nvim_popup"'<CR>

nnoremap <silent> <leader>git :LazyGit<CR>

nnoremap <silent> <leader>p :Prettier<CR>

" ----------------------------------------------------------------------------
" Quick save
nnoremap <leader>w :w<CR>
nnoremap <leader>ww :w<CR>
" Quick save & quit
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>qa :qa<CR>

" ----------------------------------------------------------------------------
" move to the window in the direction shown, or create a new split in that
" direction
func! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfu

nnoremap <leader>h :call WinMove('h')<cr>
nnoremap <leader>j :call WinMove('j')<cr>
nnoremap <leader>k :call WinMove('k')<cr>
nnoremap <leader>l :call WinMove('l')<cr>
" ----------------------------------------------------------------------------
" Floating terminal on top
nnoremap <leader>t :FloatermNew<CR>
nnoremap <leader>b :FloatermNew --title=Ranger ranger<CR>

if has('mac')
    nnoremap <silent><leader><leader>btc :FloatermNew --title=sudo cointop<CR>
else
    nnoremap <leader><leader>btc :FloatermNew --title=sudo snap run cointop<CR>
endif

" ----------------------------------------------------------------------------
" Floating terminal on top
nnoremap <leader>fav :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>favs :lua require("harpoon.ui").toggle_quick_menu()<CR>
