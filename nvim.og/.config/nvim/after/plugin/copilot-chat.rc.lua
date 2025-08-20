require("CopilotChat").setup({
	-- Add Anthropic as a provider
	providers = {
		-- Keep the default providers
		copilot = {},
		github_models = {},
		copilot_embeddings = {},
		-- Add anthropic as a custom provider
		anthropic = {
			api_key = os.getenv("ANTHROPIC_API_KEY"),
			model = "claude-3.7-sonnet",
			max_tokens = 1000,
			temperature = 0.1,
		},
	},

	-- Set default provider to anthropic
	default_provider = "anthropic",

	-- Set default model (optional, can be set in the provider config)
	model = "claude-3.7-sonnet",

	-- Rest of your config
	window = {
		layout = "float",
		relative = "editor",
		border = "rounded",
		width = 0.8,
		height = 0.6,
	},
})
