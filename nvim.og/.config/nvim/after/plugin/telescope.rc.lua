local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- load up session plugin

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = telescope.extensions.file_browser.actions -- file browser
local lga_actions = require("telescope-live-grep-args.actions") -- live grep args

telescope.setup({
	defaults = {
		-- path_display = { "truncate" },
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					-- freeze the current list and start a fuzzy search in the frozen list
					["<C-space>"] = actions.to_fuzzy_refine,
				},
			},
			-- ... also accepts theme settings, for example:
			-- theme = "dropdown", -- use dropdown theme
			-- theme = { }, -- use own theme spec
			-- layout_config = { mirror=true }, -- mirror preview pane
		},
		auto_quoting = true, -- enable/disable auto-quoting

		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

require("git-worktree").setup({})
telescope.load_extension("git_worktree")

telescope.load_extension("file_browser")
-- telescope.load_extension("possession")

vim.keymap.set("n", "<leader>fv", function()
	builtin.find_files({
		no_ignore = false,
		hidden = false,
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

vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep({ hidden = true })
end)

vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ hidden = true })
end)

vim.keymap.set("n", "<leader>b", function()
	builtin.buffers()
end)

vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)

vim.keymap.set("n", ";;", function()
	builtin.resume()
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)

vim.keymap.set("n", "<leader>fn", function()
	telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", "<leader>gr", function()
	builtin.lsp_references()
end)
