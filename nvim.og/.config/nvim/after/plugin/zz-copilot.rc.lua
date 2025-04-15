-- Configuration for the official GitHub Copilot plugin
vim.defer_fn(function()
	-- Set the Node.js path for Copilot
	-- vim.g.copilot_node_command = "$HOME/.nvm/versions/node/v20.19.0/bin/node"

	-- Filetypes configuration
	vim.g.copilot_filetypes = {
		["javascript"] = true,
		["lua"] = true,
		["json"] = true,
		["typescript"] = true,
		["yaml"] = true,
		["markdown"] = true,
		["help"] = false,
		["gitcommit"] = false,
		["gitrebase"] = false,
		["hgcommit"] = false,
		["svn"] = false,
		["cvs"] = false,
		["."] = false,
	}

	-- Tab completion behavior (similar to accept)
	vim.g.copilot_no_tab_map = true
	vim.api.nvim_set_keymap("i", "<M-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

	-- Additional keymaps (not all community plugin features are available)
	vim.api.nvim_set_keymap("i", "<M-]>", "<Plug>(copilot-next)", {})
	vim.api.nvim_set_keymap("i", "<M-[>", "<Plug>(copilot-previous)", {})
	vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-dismiss)", {})

	-- Panel-like behavior (though official plugin uses a different panel)
	vim.api.nvim_set_keymap("n", "<M-CR>", ":Copilot panel<CR>", { silent = true })

	-- Enable by default
	vim.g.copilot_enabled = 1
end, 100)

-- local status, copilot = pcall(require, "copilot")
-- if not status then
-- 	return
-- end
--
-- vim.defer_fn(function()
-- 	copilot.setup({
-- 		panel = {
-- 			enabled = true,
-- 			auto_refresh = false,
-- 			keymap = {
-- 				jump_prev = "[[",
-- 				jump_next = "]]",
-- 				accept = "<CR>",
-- 				refresh = "gr",
-- 				open = "<M-CR>",
-- 			},
-- 		},
-- 		suggestion = {
-- 			enabled = true,
-- 			auto_trigger = true,
-- 			debounce = 75,
-- 			keymap = {
-- 				-- accept = "<M-l>",
-- 				accept = "<M-CR>",
-- 				accept_word = false,
-- 				accept_line = false,
-- 				next = "<M-]>",
-- 				prev = "<M-[>",
-- 				dismiss = "<C-]>",
-- 			},
-- 		},
-- 		filetypes = {
-- 			javascript = true,
-- 			typescript = true,
-- 			yaml = true,
-- 			markdown = true,
-- 			help = false,
-- 			gitcommit = false,
-- 			gitrebase = false,
-- 			hgcommit = false,
-- 			svn = false,
-- 			cvs = false,
-- 			["."] = false,
-- 		},
-- 		copilot_node_command = "node", -- Node.js version must be > 16.x
-- 		server_opts_overrides = {
-- 			cmd = "$HOME/.nvm/versions/node/v20.19.0/bin/node", -- Path to your Node.js v20+
-- 		},
-- 	})
-- end, 100)
