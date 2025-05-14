require("og.core")
require("og.highlights")
require("og.maps")
require("og.plugins")
require("og.winmove")
require("myndis")

vim.cmd([[
    if getcwd() ==# '/Users/oskarasg/.thosefiles'
        colorscheme gruvbox-material
    else
        colorscheme tokyonight-moon
    endif

  "" colorscheme terafox
  "" colorscheme nightfox
  "" colorscheme nordfox
  "" colorscheme duskfox
]])
-- vim.opt.background = 'dark'
