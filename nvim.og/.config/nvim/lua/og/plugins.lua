local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- local js_based_languages = {
--   "typescript",
--   "javascript",
--   "typescriptreact",
--   "javascriptreact",
--   "vue",
-- }

require("lazy").setup({

	-- 'wbthomason/packer.nvim',

	"sainnhe/gruvbox-material",
	"folke/tokyonight.nvim",
	-- 'EdenEast/nightfox.nvim',
	-- use 'xiyaowong/nvim-transparent'
	-- use 'shaunsingh/nord.nvim'

	{ "nvim-lualine/lualine.nvim", requires = {
		{ "barklan/capslock.nvim" },
	} }, -- Statusline
	"nvim-lua/plenary.nvim", -- Common utilities
	"onsails/lspkind-nvim", -- vscode-like pictograms

	-- 'hrsh7th/cmp-cmdline', -- cmd cmp
	-- 'andersevenrud/cmp-tmux',
	-- 'kristijanhusak/vim-dadbod-completion',

	-- { ',tzachar/cmp-tabnine', run = './install.sh' }
	"neovim/nvim-lspconfig", -- LSP
	"j-hui/fidget.nvim", -- nvim-lsp progress for impatient

	-- CMP
	"ray-x/cmp-treesitter",
	"bydlw98/cmp-env",
	"hrsh7th/nvim-cmp", -- Completion
	"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
	"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
	"saadparwaiz1/cmp_luasnip", -- snippets cmp
	-- 'hrsh7th/cmp-nvim-lua', -- nvim-cmp source for Lua keywords
	"hrsh7th/cmp-path", -- nvim-cmp source for file paths
	"chrisgrieser/cmp-nerdfont",
	-- "jcha0713/cmp-tw2css"

	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},

	"nvimtools/none-ls.nvim", -- Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			--   { 'avneesh0612/react-nextjs-snippets' },
		},
	}, -- Snippets
	-- "kipp01/stylua-nvim",

	"nvim-treesitter/nvim-treesitter",

	"nvim-treesitter/nvim-treesitter-textobjects",
	"kyazdani42/nvim-web-devicons", -- File icons

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	},
	-- 'JoosepAlviste/nvim-ts-context-commentstring',
	-- 'terrortylor/nvim-comment',

	"norcalli/nvim-colorizer.lua",
	"MeanderingProgrammer/render-markdown.nvim",
	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
	},

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

	"nvim-tree/nvim-tree.lua",

	"lewis6991/gitsigns.nvim", -- Git signs
	"kdheepak/lazygit.nvim", -- For git blame & browse
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = false })
		end,
	},

	"theprimeagen/harpoon",
	"ThePrimeagen/refactoring.nvim",
	"polarmutex/git-worktree.nvim",

	-- use 'tpope/vim-fugitive'
	-- use 'tpope/vim-abolish'
	-- use 'tpope/vim-unimpaired'

	-- 'tpope/vim-dadbod', -- interact with DB
	-- 'kristijanhusak/vim-dadbod-ui',
	-- 'tpope/vim-surround',
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- use 'tpope/vim-markdown'
	-- use 'tpope/vim-obsession'
	-- use 'tpope/vim-dotenv'
	-- use 'tpope/vim-speeddating'
	-- use 'tpope/vim-repeat'

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	"voldikss/vim-floaterm",
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	"nvim-telekasten/calendar-vim",

	{
		"chrsm/impulse.nvim",
		config = function()
			require("impulse").setup({})
		end,
		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},

	"christoomey/vim-system-copy",
	"folke/which-key.nvim",

	"goolord/alpha-nvim",

	"lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time.
	-- 'jbyuki/venn.nvim', -- draw ASCII

	{
		"github/copilot.vim",
		init = function()
			-- This runs before the plugin loads, to set NODE version
			vim.g.copilot_node_command = os.getenv("HOME") .. "/.nvm/versions/node/v20.19.0/bin/node"
		end,
	},

	-- 'jackMort/ChatGPT.nvim',
	-- 'MunifTanjim/nui.nvim',

	"windwp/nvim-spectre", -- search panel for NeoVim
	"mbbill/undotree",

	"jedrzejboczar/possession.nvim", -- session manager

	{ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
	-- use 's1n7ax/nvim-window-picker'

	{ "Wansmer/treesj", requires = "nvim-treesitter" }, -- split or join blocks of code

	{
		"cshuaimin/ssr.nvim",
		module = "ssr",
		config = function()
			require("ssr").setup({
				border = "rounded",
				min_width = 50,
				min_height = 5,
				max_width = 120,
				max_height = 25,
				adjust_window = true,
				keymaps = {
					close = "q",
					next_match = "n",
					prev_match = "N",
					replace_confirm = "<cr>",
					replace_all = "<leader><cr>",
				},
			})
		end,
	}, -- structural search and replace
	-- 'simrat39/symbols-outline.nvim', -- tree like view/manager for symbols
	{ "barrett-ruth/import-cost.nvim", run = "sh install.sh yarn" }, -- display the costs of javascript imports

	"dnlhc/glance.nvim", -- preview LSP locations (definition etc.)
	"xorid/swap-split.nvim", -- swap windows/panes
	-- use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' } -- handy pop-up menu for code actions

	-- use "rest-nvim/rest.nvim" -- http client written in Lua.

	-- lazy.nvim:

	-- Folding
	"kevinhwang91/nvim-ufo",
	"kevinhwang91/promise-async",

	-- Folding side column
	{
		"luukvbaal/statuscol.nvim",
		opts = function()
			local builtin = require("statuscol.builtin")
			return {
				setopt = true,
				-- override the default list of segments with:
				-- number-less fold indicator, then signs, then line number & separator
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{
						text = { builtin.lnumfunc, " " },
						condition = { true, builtin.not_empty },
						click = "v:lua.ScLa",
					},
				},
			}
		end,
	},

	"David-Kunz/jester", -- jest
	"folke/todo-comments.nvim",

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	},

	"dstein64/nvim-scrollview",
})
