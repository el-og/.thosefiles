local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function current_buffer_number()
    return "b:" .. vim.api.nvim_get_current_buf()
end

local function session_name()
    return require('possession.session').session_name or ''
end

local colors = {
    -- red = '#ca1243',
    grey = '#F3F4ED',
    -- light_grey = '#bebebe',
    -- black = '#383a42',
    -- white = '#f3f3f3',
    -- light_green = '#83a598',
    -- orange = '#fe8019',
    -- green = '#8ec07c',
    -- synth_dark = '#4a495f',
    -- synth_light = '#5c2c6d',
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff',
            { 'diagnostics', sources = { 'nvim_lsp', 'coc' } },
            fg = colors.white, bg = colors.white,
        },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_x = {
            -- session_name,
            -- { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
            --     hint = ' ' } },
            'encoding',
            'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        -- lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
    },
    extensions = {}
}


-- from net

--
-- local theme = {
--     normal = {
--         a = { fg = colors.white, bg = colors.synth_dark },
--         b = { fg = colors.white, bg = colors.synth_dark },
--         c = { fg = colors.black, bg = colors.black },
--         z = { fg = colors.white, bg = colors.black },
--     },
--     insert = { a = { fg = colors.black, bg = colors.light_green } },
--     visual = { a = { fg = colors.black, bg = colors.orange } },
--     replace = { a = { fg = colors.black, bg = colors.green } },
-- }
--
-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--     self.status = ''
--     self.applied_separator = ''
--     self:apply_highlights(default_highlight)
--     self:apply_section_separators()
--     return self.status
-- end
--
-- -- Put proper separators and gaps between components in sections
-- local function process_sections(sections)
--     for name, section in pairs(sections) do
--         local left = name:sub(9, 10) < 'x'
--         for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
--             table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.light_grey } })
--         end
--         for id, comp in ipairs(section) do
--             if type(comp) ~= 'table' then
--                 comp = { comp }
--                 section[id] = comp
--             end
--             comp.separator = left and { right = '' } or { left = '' }
--         end
--     end
--     return sections
-- end
--
-- local function search_result()
--     if vim.v.hlsearch == 0 then
--         return ''
--     end
--     local last_search = vim.fn.getreg('/')
--     if not last_search or last_search == '' then
--         return ''
--     end
--     local searchcount = vim.fn.searchcount { maxcount = 9999 }
--     return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
-- end
--
-- local function modified()
--     if vim.bo.modified then
--         return '+'
--     elseif vim.bo.modifiable == false or vim.bo.readonly == true then
--         return '-'
--     end
--     return ''
-- end
--
-- require('lualine').setup {
--     options = {
--         theme = theme,
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--     },
--     sections = process_sections {
--         lualine_a = { 'mode' },
--         lualine_b = {
--             'branch',
--             'diff',
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'error' },
--                 diagnostics_color = { error = { bg = colors.synth_light, fg = colors.white } },
--             },
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'warn' },
--                 diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--             },
--             -- { 'filename', file_status = false },
--             { modified, color = { bg = colors.synth_light } },
--             {
--                 '%w',
--                 cond = function()
--                     return vim.wo.previewwindow
--                 end,
--             },
--             {
--                 '%r',
--                 cond = function()
--                     return vim.bo.readonly
--                 end,
--             },
--             {
--                 '%q',
--                 cond = function()
--                     return vim.bo.buftype == 'quickfix'
--                 end,
--             },
--         },
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = { search_result, 'filetype' },
--         lualine_z = { '%l:%c', '%p%%/%L' },
--     },
--     inactive_sections = {
--         lualine_c = { '%f %y %m' },
--         lualine_x = {},
--     },
--     tabline = {
--         lualine_a = { 'buffers' },
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'tabs' }
--     },
-- }
