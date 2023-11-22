vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.g['rooter_cd_cmd'] = 'lcd'

-- highlight yanked text for 200ms using the "Visual" highlight group
-- vim.cmd [[
--   augroup highlight_yank
--   autocmd!
--   au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
--   augroup END
-- ]]
--
local augroup = vim.api.nvim_create_augroup
local FuentasticGroup = augroup('staff', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 350,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = FuentasticGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.cmd [[
--   set cursorline
--   hi cursorline cterm=none term=none
--   autocmd WinEnter * setlocal cursorline
--   autocmd WinLeave * setlocal nocursorline
--   highlight CursorLine guibg=#ffffff ctermbg=128
--   highlight Normal guibg=none
-- ]]

-- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white'} )
