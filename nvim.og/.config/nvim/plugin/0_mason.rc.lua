local status, mason = pcall(require, "mason")
if not status then
	return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

mason.setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
		"css_lsp",
		"html_lsp",
		"lua_language_server",
		"js-debug-adapter",
		"eslint-lsp",
	},
})

lspconfig.setup({
	automatic_installation = true,
})
