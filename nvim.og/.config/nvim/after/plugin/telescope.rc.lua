local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

-- load up session plugin

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = telescope.extensions.file_browser.actions -- file browser
local lga_actions = require("telescope-live-grep-args.actions") -- live grep args

telescope.setup {
    defaults = {
        path_display={"truncate"},
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
    extensions = {
        auto_quoting = true, -- enable/disable auto-quoting

        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

telescope.load_extension("file_browser")
-- telescope.load_extension("possession")

vim.keymap.set('n', '<leader>fv',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end)

vim.keymap.set("n", "<leader>sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
    })
end)

vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep({ hidden = true })
end)

vim.keymap.set('n', ';g', function()
    builtin.grep_string({ hidden = true })
end)

vim.keymap.set('n', '<leader>b', function()
    builtin.buffers()
end)

vim.keymap.set('n', ';t', function()
    builtin.help_tags()
end)

vim.keymap.set('n', ';;', function()
    builtin.resume()
end)

vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)

vim.keymap.set("n", "<leader>fn", function()
    telescope.extensions.live_grep_args.live_grep_args()
end)
