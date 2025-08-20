require("jester").setup({
	cmd = "npx jest -t '$result' -- $file",
})

vim.keymap.set("n", "<leader>t", ":lua require('jester').run()<CR>", { silent = true })

-- -- Search in selection text
--
-- _G.search_in_selection = function()
-- 	local start_line, start_col = vim.fn.line("'<"), vim.fn.col("'<")
-- 	local end_line, end_col = vim.fn.line("'>"), vim.fn.col("'>")
--
-- 	-- Prompt for search pattern
-- 	local pattern = vim.fn.input("Search in selection: ")
-- 	if pattern == "" then
-- 		return
-- 	end
--
-- 	-- Escape special characters in the pattern
-- 	pattern = vim.fn.escape(pattern, "/\\[]")
--
-- 	-- Construct the command
-- 	local command = string.format(
-- 		"/\\%%>%dl\\%%<%dl\\%%>%dc\\%%<%dc\\M%s",
-- 		start_line - 1,
-- 		end_line + 1,
-- 		start_col - 1,
-- 		end_col + 1,
-- 		pattern
-- 	)
--
-- 	-- Execute the search
-- 	vim.fn.execute("normal! " .. command)
-- end
--
-- vim.api.nvim_set_keymap("x", "/", [[<cmd>lua _G.search_in_selection()<CR>]], { noremap = true, silent = true })
