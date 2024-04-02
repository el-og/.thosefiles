local status, comment = pcall(require, "Comment")
if (not status) then return end

require('ts_context_commentstring').setup({ enable_autocmd = false, })

-- require('nvim_comment').setup({
--     comment_empty = false,
--     hook = function()
--         if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
--           require("ts_context_commentstring.internal").update_commentstring()
--         end
--     end
-- })

comment.setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

 -- comment.setup {
 --   pre_hook = function(ctx)
 --     -- Only calculate commentstring for tsx filetypes
 --     if vim.bo.filetype == 'typescriptreact' then
 --       local U = require('Comment.utils')
 --
 --       -- Determine whether to use linewise or blockwise commentstring
 --       local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'
 --
 --       -- Determine the location where to calculate commentstring from
 --       local location = nil
 --       if ctx.ctype == U.ctype.blockwise then
 --         location = require('ts_context_commentstring.utils').get_cursor_location()
 --       elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
 --         location = require('ts_context_commentstring.utils').get_visual_start_location()
 --       end
 --
 --       return require('ts_context_commentstring').calculate_commentstring({
 --         key = type,
 --         location = location,
 --       })
 --     end
 --   end,
 -- }
