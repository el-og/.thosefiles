local status, copilot = pcall(require, "copilot")
if (not status) then return end

vim.defer_fn(function()
    copilot.setup(
        {
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    -- accept = "<M-l>",
                    accept = "<M-CR>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                javascript = true,
                typescript = true,
                yaml = false,
                markdown = true,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = 'node', -- Node.js version must be > 16.x
            server_opts_overrides = {},
        }
    )
end, 100)

-- use {
--   "zbirenbaum/copilot-cmp",
--   after = { "copilot.lua" },
--   config = function()
--     require("copilot_cmp").setup()
--   end
-- }


-- https://github.com/zbirenbaum/copilot.lua/issues/91#issuecomment-1345190310
-- -- For super tab like mapping, disable the built-in mapping:
--
-- require("copilot").setup({
--   suggestion = {
--     accept = false,
--   },
-- })
-- -- and define the mapping yourself:
--
-- vim.keymap.set("i", '<Tab>', function()
--   if require("copilot.suggestion").is_visible() then
--     require("copilot.suggestion").accept()
--   else
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
--   end
-- end, {
--   silent = true,
-- })
-- -- or if you're using nvim-cmp, you can do something like this:
--
-- cmp.setup({
--   -- ...
--   mapping = {
--     -- ...
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if require("copilot.suggestion").is_visible() then
--         require("copilot.suggestion").accept()
--       elseif cmp.visible() then
--         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
--       elseif luasnip.expandable() then
--         luasnip.expand()
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--     -- ...
--   },
--   -- ...
-- })
