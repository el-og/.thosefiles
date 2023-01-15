local keymap = vim.keymap
local silent = { silent = true }

vim.g.mapleader = " "

keymap.set("n", "<leader>git", ":LazyGit<CR>", silent)

-- console.log('word_on_cursor:', word_on_cursor)
keymap.set("n", "sl", "\"ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>", silent)

-- change word under cursor
keymap.set("n", "sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], silent)

-- find and replace all selected characted (visual mode)
keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>", silent)

-- quick save
keymap.set("n", "<leader>w", ":w<CR>", silent)
keymap.set("n", "<leader>ww", ":w<CR>", silent)

-- quick save & quit
keymap.set("n", "<leader>wq", ":wq<CR>", silent)

-- quick quit
keymap.set("n", "<leader>q", ":q<CR>", silent)
keymap.set("n", "<leader>qq", ":q<CR>", silent)
keymap.set("n", "<leader>qa", ":SSave! last_session <CR> | :qa <CR>", silent)

-- offtopic
keymap.set("n", "<leader><leader>btc", ":FloatermNew --title=sudo cointop<CR>", silent)

-- harpoon

-- nnoremap <silent><leader>s :lua require("harpoon.mark").add_file()<CR>
-- nnoremap <silent><leader>ss :lua require("harpoon.ui").toggle_quick_menu()<CR>

-- MISC
--nnoremap <silent><leader><leader>e :! notify_errors_nvim.sh <CR>
-- nnoremap <silent><leader><leader>ll :vsp ~/Projects/platform/packages/api/api-eslint-errors.txt <CR>

vim.cmd [[

]]
