local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		-- Your preferred path display
		path_display = { "filename_first" },

		-- Layout
		layout_strategy = "horizontal",

		-- Ignore these patterns in all pickers
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"dist/",
			"build/",
			"%.lock",
			"package-lock.json",
		},

		-- Start in insert mode
		initial_mode = "insert",

		-- Better sorting
		sorting_strategy = "ascending",

		-- Show prompt at top
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			},
			width = 0.90,
			height = 0.85,
		},

		-- Default mappings
		mappings = {
			i = {
				-- Move in insert mode
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				-- Close with Esc in insert mode
				["<esc>"] = actions.close,

				-- Scroll preview
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				-- Send to quickfix
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				["q"] = actions.close,
				["<esc>"] = actions.close,

				-- Send to quickfix
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},

	pickers = {
		-- File pickers
		find_files = {
			hidden = true,
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},

		git_files = {
			show_untracked = true,
		},

		-- Grep pickers
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},

		grep_string = {
			additional_args = function()
				return { "--hidden" }
			end,
		},

		-- Buffer picker
		buffers = {
			sort_lastused = true,
			sort_mru = true,
			ignore_current_buffer = false,
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		},

		-- LSP pickers
		lsp_references = {
			show_line = false,
			fname_width = 50,
		},

		lsp_definitions = {
			fname_width = 50,
		},

		lsp_document_symbols = {
			symbol_width = 50,
		},

		-- Diagnostics
		diagnostics = {
			line_width = "full",
			bufnr = 0, -- current buffer only by default
		},

		-- Help tags
		help_tags = {
			mappings = {
				i = {
					["<CR>"] = actions.select_vertical,
				},
			},
		},

		-- Command history
		command_history = {
			mappings = {
				i = {
					["<C-e>"] = actions.edit_command_line,
				},
			},
		},
	},

	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = require("telescope").extensions.file_browser.actions.create,
					["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

-- Enhanced keymaps with more pickers
local keymap = vim.keymap.set

-- File pickers
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fv", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fa", function()
	builtin.find_files({ no_ignore = true, hidden = true })
end, { desc = "Find all files" })
keymap("n", "<leader>fg", builtin.git_files, { desc = "Git files" })

-- Grep pickers
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
keymap("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
keymap("n", "<leader>fb", function()
	builtin.live_grep({ grep_open_files = true })
end, { desc = "Grep in open buffers" })

-- Buffer picker
keymap("n", "<leader>b", builtin.buffers, { desc = "Buffers" })

-- LSP pickers
keymap("n", "<leader>gr", builtin.lsp_references, { desc = "LSP references" })
keymap("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP definitions" })
keymap("n", "<leader>gi", builtin.lsp_implementations, { desc = "LSP implementations" })
keymap("n", "<leader>gs", builtin.lsp_document_symbols, { desc = "Document symbols" })
keymap("n", "<leader>gw", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })

-- Diagnostics
keymap("n", ";e", builtin.diagnostics, { desc = "Diagnostics" })
keymap("n", "<leader>fd", function()
	builtin.diagnostics({ bufnr = 0 })
end, { desc = "Buffer diagnostics" })

-- Other useful pickers
keymap("n", ";t", builtin.help_tags, { desc = "Help tags" })
keymap("n", ";;", builtin.resume, { desc = "Resume last picker" })
keymap("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
keymap("n", "<leader>fc", builtin.command_history, { desc = "Command history" })
keymap("n", "<leader>fs", builtin.search_history, { desc = "Search history" })
keymap("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
-- keymap("n", "<leader>fm", builtin.marks, { desc = "Marks" })

-- File browser
keymap("n", "<leader>sf", function()
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
end, { desc = "File browser" })
