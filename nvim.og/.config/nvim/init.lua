require('og.core')
require('og.highlights')
require('og.maps')
require('og.plugins')
require('og.winmove')

vim.cmd [[
    if getcwd() ==# '/Users/oskarasg/.thosefiles'
        colorscheme gruvbox-material
    else
        colorscheme zephyr
    endif
        hi LineNr guifg=#b5b3b3

  "" colorscheme terafox
  "" colorscheme nightfox
  "" colorscheme nordfox
  "" colorscheme duskfox
]]
-- vim.opt.background = 'dark'
