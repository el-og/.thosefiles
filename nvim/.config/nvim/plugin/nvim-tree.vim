
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>n :NvimTreeFindFileToggle<CR>

lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

local circle = "○"

-- DevIcons
local devIcons = require("nvim-web-devicons")
local override_icons = devIcons.get_icons()
for _, icon in pairs(override_icons) do icon.icon = circle end
devIcons.setup({override = override_icons, default = true})

-- NvimTree
vim.g.nvim_tree_icons = {
}

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


