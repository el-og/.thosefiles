noremap  <silent><leader>fv <cmd>Telescope find_files hidden=true<cr> 
" nnoremap  <silent><leader>fg :lua require('telescope.builtin').live_grep()<cr> 

noremap <silent><leader>ff :lua require('telescope.builtin').resume()<CR>
noremap <silent><leader>fg <cmd>Telescope live_grep hidden=true<cr>
noremap <silent><leader>fh <cmd>:lua require("telescope").extensions.live_grep_args.live_grep_args({ hidden = true })<cr>

nnoremap <leader>dt :silent exec '! tmux display-popup -h 90\% -w 90\% -E "tmux attach -d -t nvim_popup \|\| tmux new -s nvim_popup"'<CR>

nnoremap <silent> <leader>git :LazyGit<CR>

nnoremap <silent> <leader>p :Prettier<CR>

nmap <silent>sl "ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>

nmap <silent>~ :bp<CR>
nmap <silent>Z :bn<CR>

" replace selected (all instances)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


" ----------------------------------------------------------------------------
" Quick save
nnoremap <leader>w :w<CR>
nnoremap <leader>ww :w<CR>
" Quick save & quit
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>qa :SSave! last_session <bar> :qa<CR>

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
nnoremap <silent><leader>s :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>ss :lua require("harpoon.ui").toggle_quick_menu()<CR>


" MY STUFF

nnoremap <silent><leader><leader>e :! notify_errors_nvim.sh <CR>
nnoremap <silent><leader><leader>ll :vsp ~/Projects/platform/packages/api/api-eslint-errors.txt <CR>

"Quick search word with telescope
nnoremap <expr> <leader>sw ':Telescope find_files<cr>' . "'" . expand('<cword>')
" nnoremap <silent><leader>fg <cmd>Telescope live_grep hidden=true<cr>

lua << EOF
require('telescope').setup{
	defaults = {
		path_display={"smart"} 
	}
}
EOF
