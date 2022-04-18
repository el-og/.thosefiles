nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>n :NvimTreeFindFileToggle<CR>

" let g:renderer.indent_markers.enable=1
lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.renderer.indent_markers.enable=1
require'nvim-tree'.setup {
    renderer = {
    -- This option shows indent markers when folders are open.
        indent_markers = {
          enable = true,
          icons = {
            corner = '└ ',
            edge = '│ ',
            none = '  ',
          },
        },
    },
    view = {
        -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
        width = 50,
        -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
        height = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        -- if true the tree will resize itself after opening a file
        auto_resize = true
    }
}

-- DevIcons
local devIcons = require("nvim-web-devicons").get_icons()


EOF

"
" require'nvim-tree.view'.win_open()
" local tree_cb = require'nvim-tree.config'.nvim_tree_callback
" function tree_open_close()
"   vim.cmd(":lua require'nvim-tree'.on_keypress('edit')")
"   vim.g.tree_open = 1
" end
" function tree_close_close()
"   vim.cmd("lua require'nvim-tree'.on_keypress('close')")
"   vim.g.tree_open = 0
" end
" function close_tab_tree_reopen()
"   if vim.g.tree_open == 1 then
"     vim.cmd("NvimTreeClose")
"     vim.cmd("silent! bd")
"     vim.cmd("NvimTreeOpen")
"     vim.cmd("wincmd p")
"   else
"     vim.cmd("silent! bd")
"   end
" end
" vim.g.nvim_tree_bindings = {
"   { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = ":lua tree_open_close()<CR>" },
"   { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
"   { key = "<C-v>",                        cb = tree_cb("vsplit") },
"   { key = "<C-x>",                        cb = tree_cb("split") },
"   { key = "<C-t>",                        cb = tree_cb("tabnew") },
"   { key = "<",                            cb = tree_cb("prev_sibling") },
"   { key = ">",                            cb = tree_cb("next_sibling") },
"   { key = "P",                            cb = tree_cb("parent_node") },
"   { key = "<BS>",                         cb = tree_cb("close_node") },
"   { key = "<S-CR>",                       cb = tree_cb("close_node") },
"   { key = "<Tab>",                        cb = tree_cb("preview") },
"   { key = "K",                            cb = tree_cb("first_sibling") },
"   { key = "J",                            cb = tree_cb("last_sibling") },
"   { key = "I",                            cb = tree_cb("toggle_ignored") },
"   { key = "H",                            cb = tree_cb("toggle_dotfiles") },
"   { key = "R",                            cb = tree_cb("refresh") },
"   { key = "a",                            cb = tree_cb("create") },
"   { key = "d",                            cb = tree_cb("remove") },
"   { key = "r",                            cb = tree_cb("rename") },
"   { key = "<C-r>",                        cb = tree_cb("full_rename") },
"   { key = "x",                            cb = tree_cb("cut") },
"   { key = "c",                            cb = tree_cb("copy") },
"   { key = "p",                            cb = tree_cb("paste") },
"   { key = "y",                            cb = tree_cb("copy_name") },
"   { key = "Y",                            cb = tree_cb("copy_path") },
"   { key = "gy",                           cb = tree_cb("copy_absolute_path") },
"   { key = "[c",                           cb = tree_cb("prev_git_item") },
"   { key = "]c",                           cb = tree_cb("next_git_item") },
"   { key = "-",                            cb = tree_cb("dir_up") },
"   { key = "q",                            cb = ":lua tree_close_close()<CR>" },
"   { key = "g?",                           cb = tree_cb("toggle_help") },
" }


