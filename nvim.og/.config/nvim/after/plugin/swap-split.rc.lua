-- Default settings
require("swap-split").setup({
    ignore_filetypes = {
        "NvimTree"
    }
})

vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>SwapSplit<CR>', { noremap = true })
