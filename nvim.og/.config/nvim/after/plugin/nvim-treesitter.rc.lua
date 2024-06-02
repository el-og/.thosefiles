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

treesitter.on_config_done = function()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.ejs = {
		install_info = {
			url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
			files = { "src/parser.c" },
			requires_generate_from_grammar = true,
		},
		filetype = "ejs",
	}
end
