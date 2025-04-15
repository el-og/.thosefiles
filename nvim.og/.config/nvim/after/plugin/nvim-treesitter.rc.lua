local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
	return
end

treesitter.setup({
	context_commentstring = {
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "{/* %s */}",
				jsx_self_closing_element = "{/* %s */}",
				comment = "// %s",
			},
			typescript = { __default = "// %s", __multiline = "/* %s */" },
		},
	},
})
-- In your Neovim configuration file (init.lua or init.vim)

-- Install required parsers
require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "javascript" },
	-- ... other Treesitter configurations
})

-- EVERYTHING BELOW IS FOR EJS SYNTAX HIGHLIGHTING
-- Set up filetype detection for .ejs
vim.filetype.add({
	extension = {
		ejs = "html",
	},
})

-- Configure Treesitter to use HTML parser for .ejs files
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.ejs = {
	install_info = {
		url = "https://github.com/tree-sitter/tree-sitter-html",
		files = { "src/parser.c", "src/scanner.c" },
	},
	filetype = "html",
}
