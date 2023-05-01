-- vim.opt.nocompatible = true -- usually good idea to turn it on just in case
vim.opt.path:append('**')

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'

vim.opt.exrc = true
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.hidden = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true


vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 40

vim.opt.encoding = 'utf-8'

vim.opt.confirm = true

-- vim.opt.shortmess:append('c') -- messages about swap files

vim.opt.laststatus = 2
-- vim.opt.statusline = '\ %F'

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.guicursor:append('a:-Cursor-blinkwait175-blinkoff150-blinkon175')
vim.opt.splitright = true
vim.opt.cursorline = true
