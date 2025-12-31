local status, avante = pcall(require, "avante")
if not status then
	return
end

avante.setup({
	provider = "copilot",

	providers = {
		copilot = {
			endpoint = "https://api.githubcopilot.com",
			model = "gpt-4o-2024-05-13",
			timeout = 30000,
			temperature = 0,
			max_tokens = 4096,
		},
	},

	behaviour = {
		auto_suggestions = false,
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
	},

	mappings = {
		ask = "<leader>aa",
		edit = "<leader>ae",
		refresh = "<leader>ar",
	},

	windows = {
		position = "right",
		wrap = true,
		width = 30,
	},
})

-- Optional: Add custom keymaps here
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChat<cr>", { desc = "Avante Chat" })
vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "Avante Edit" })
