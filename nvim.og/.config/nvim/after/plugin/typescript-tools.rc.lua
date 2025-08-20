require("typescript-tools").setup({
	-- Enable the JSX/TSX specific features
	settings = {
		-- Enable completions for React components
		tsserver_file_preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsWithSnippetText = true,
			includeAutomaticOptionalChainCompletions = true,
			includeCompletionsWithInsertText = true,
		},
		-- JSX close tag feature
		jsx_close_tag = {
			enable = true, -- Set to true to enable the feature
			filetypes = { "javascriptreact", "typescriptreact" },
		},
	},
	-- Specify which filetypes should be handled
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})
