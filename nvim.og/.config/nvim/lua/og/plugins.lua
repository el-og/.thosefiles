local utils = require("og.utils")
local fn = vim.fn

local packer_bootstrap
if not utils.is_plugin_installed("packer.nvim") then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        utils.plugins_path .. "/start/packer.nvim",
    })
    vim.cmd([[packadd packer.nvim]])
end

local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]


packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'pwntester/octo.nvim'

    use 'sainnhe/gruvbox-material'
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'nvimdev/zephyr-nvim'
    use 'karb94/neoscroll.nvim' -- smooth scrolling
    -- use 'xiyaowong/nvim-transparent'
    -- use 'shaunsingh/nord.nvim'

    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'onsails/lspkind-nvim' -- vscode-like pictograms

    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for Lua keywords
    use 'hrsh7th/cmp-path' -- nvim-cmp source for file paths
    use 'hrsh7th/cmp-cmdline' -- cmd cmp
    use 'saadparwaiz1/cmp_luasnip' -- snippets cmp
    -- use 'andersevenrud/cmp-tmux'
    use 'bydlw98/cmp-env'
    -- use 'kristijanhusak/vim-dadbod-completion'

    -- use { 'tzachar/cmp-tabnine', run = './install.sh' }
    use 'neovim/nvim-lspconfig' -- LSP
    -- use'j-hui/fidget.nvim' -- nvim-lsp progress for impatient
    use 'ray-x/cmp-treesitter'
    use 'chrisgrieser/cmp-nerdfont'
    -- use "jcha0713/cmp-tw2css"

    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'hashivim/vim-terraform'

    use 'rcarriga/nvim-notify' -- Notifications

    use({
        "nvimdev/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end,
    })
    use { 'L3MON4D3/LuaSnip', requires = {
        { 'rafamadriz/friendly-snippets' },
        --   { 'avneesh0612/react-nextjs-snippets' },
    } } -- Snippets

    use 'nvim-treesitter/nvim-treesitter'

    -- use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-tree/nvim-web-devicons' -- File icons

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-live-grep-args.nvim'
    use 'cljoly/telescope-repo.nvim' -- :Telescope repo list
    -- use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-lua/popup.nvim' -- Dependency for telescipe media

    -- use 'edluffy/hologram.nvim' -- experimental preview for images

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use { 'numToStr/Comment.nvim',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        }
    }

    use 'norcalli/nvim-colorizer.lua'
    -- use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "ellisonleao/glow.nvim" -- glow markdown
    use 'jinh0/eyeliner.nvim' -- more intuitive remap for F/f

    -- use 'nvim-tree/nvim-tree.lua'
    use {'nvim-neo-tree/neo-tree.nvim', requires = 'MunifTanjim/nui.nvim'}

    use 'lewis6991/gitsigns.nvim' -- Git signs
    use 'kdheepak/lazygit.nvim' -- For git blame & browse
    use 'f-person/git-blame.nvim' -- For git blame & browse

    use 'theprimeagen/harpoon'
    use "ThePrimeagen/refactoring.nvim"

    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-abolish'
    -- use 'tpope/vim-unimpaired'
    -- use 'tpope/vim-dadbod' -- interact with DB
    -- use 'kristijanhusak/vim-dadbod-ui'
    use 'tpope/vim-surround'
    -- use 'tpope/vim-markdown'
    -- use 'tpope/vim-obsession'
    -- use 'tpope/vim-dotenv'
    -- use 'tpope/vim-speeddating'
    -- use 'tpope/vim-repeat'

    use 'voldikss/vim-floaterm'
    use 'renerocksai/telekasten.nvim'
    use 'renerocksai/calendar-vim'

    use {
        "chrsm/impulse.nvim",
        config = function()
            require("impulse").setup({})
        end,
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    }

    use 'christoomey/vim-system-copy'
    use 'folke/which-key.nvim'

    use 'goolord/alpha-nvim'

    use "lewis6991/impatient.nvim" -- Speed up loading Lua modules in Neovim to improve startup time.
    use "jbyuki/venn.nvim" -- draw ASCII

    use "zbirenbaum/copilot.lua"

    use 'jackMort/ChatGPT.nvim'
    use 'MunifTanjim/nui.nvim'

    use 'windwp/nvim-spectre' -- search panel for NeoVim
    use 'mbbill/undotree'

    use 'jedrzejboczar/possession.nvim' -- session manager

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 's1n7ax/nvim-window-picker'

    use { 'Wansmer/treesj', requires = 'nvim-treesitter' } -- split or join blocks of code

    use { "cshuaimin/ssr.nvim", module = "ssr" } -- structural search and replace
    use 'simrat39/symbols-outline.nvim' -- tree like view/manager for symbols
    use { 'barrett-ruth/import-cost.nvim', run = 'sh install.sh yarn' } -- display the costs of javascript imports

    use "dnlhc/glance.nvim" -- preview LSP locations (definition etc.)

    -- PlantUML dependencies + plugin itself
    -- use "weirongxu/plantuml-previewer.vim"
    use "aklt/plantuml-syntax"
    -- use "tyru/open-browser.vim"

    -- minimal PlantUML plugin
    use 'caosystema/nvim-soil'
    -- Optional for puml syntax highlighting:
    -- use 'caosystema/nvim-nyctophilia'

    use 'xorid/swap-split.nvim' -- swap windows/panes
    -- use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' } -- handy pop-up menu for code actions

    use "rest-nvim/rest.nvim" -- http client written in Lua.

    -- Debugging

    -- use 'mfussenegger/nvim-dap'
    -- use "ravenxrz/DAPInstall.nvim"
    -- use 'Pocco81/dap-buddy.nvim'
    use "rcarriga/nvim-dap-ui"
    -- use 'David-Kunz/jester' -- jest
    use "folke/todo-comments.nvim"

    use "lukas-reineke/indent-blankline.nvim" -- indent

    use 'stevearc/oil.nvim' -- file explorer
    require("oil").setup()


end)

if packer_bootstrap then
    require("packer").sync()
end
-- https://github.com/andrewferrier/debugprint.nvim
