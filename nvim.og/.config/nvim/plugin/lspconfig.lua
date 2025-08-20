require("mason").setup()

require("mason-lspconfig").setup({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})
