vim.cmd([[
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
]])

vim.keymap.set("n", "<leader>h", "<Cmd>call WinMove('h')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<Cmd>call WinMove('j')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<Cmd>call WinMove('k')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<Cmd>call WinMove('l')<CR>", { noremap = true, silent = true })
