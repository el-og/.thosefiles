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

    'sainnhe/gruvbox-material',
    'folke/tokyonight.nvim',
    -- 'EdenEast/nightfox.nvim',
    -- use 'xiyaowong/nvim-transparent'
    -- use 'shaunsingh/nord.nvim'

    { 'nvim-lualine/lualine.nvim', requires = {
        { 'barklan/capslock.nvim' },
    } }, -- Statusline
    'nvim-lua/plenary.nvim', -- Common utilities
    'onsails/lspkind-nvim', -- vscode-like pictograms

    -- 'hrsh7th/cmp-cmdline', -- cmd cmp
    -- 'andersevenrud/cmp-tmux',
    -- 'kristijanhusak/vim-dadbod-completion',

    -- { ',tzachar/cmp-tabnine', run = './install.sh' }
    'neovim/nvim-lspconfig', -- LSP
    'j-hui/fidget.nvim', -- nvim-lsp progress for impatient

    -- CMP
    'ray-x/cmp-treesitter',
    'bydlw98/cmp-env',
    'hrsh7th/nvim-cmp', -- Completion
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
    'saadparwaiz1/cmp_luasnip', -- snippets cmp
    -- 'hrsh7th/cmp-nvim-lua', -- nvim-cmp source for Lua keywords
    'hrsh7th/cmp-path', -- nvim-cmp source for file paths
    'chrisgrieser/cmp-nerdfont',
    -- "jcha0713/cmp-tw2css"

    'jose-elias-alvarez/null-ls.nvim', -- Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },


    ({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require('lspsaga').setup({})
        end,
    }),
    { 'L3MON4D3/LuaSnip', depencies = {
      { 'rafamadriz/friendly-snippets' },
        --   { 'avneesh0612/react-nextjs-snippets' },
    } }, -- Snippets

    'nvim-treesitter/nvim-treesitter',

    'nvim-treesitter/nvim-treesitter-textobjects',
    'kyazdani42/nvim-web-devicons', -- File icons

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',

    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    {
        "numToStr/Comment.nvim",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring"
    },
    -- 'JoosepAlviste/nvim-ts-context-commentstring',
    -- 'terrortylor/nvim-comment',

    'norcalli/nvim-colorizer.lua',
    -- use 'folke/zen-mode.nvim'
    -- ({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- }),

    'nvim-tree/nvim-tree.lua',

    'lewis6991/gitsigns.nvim', -- Git signs
    'kdheepak/lazygit.nvim', -- For git blame & browse
    {'f-person/git-blame.nvim',
        config = function()
            require('gitblame').setup({enabled = false})
        end
    },

    'theprimeagen/harpoon',
    "ThePrimeagen/refactoring.nvim",

    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-abolish'
    -- use 'tpope/vim-unimpaired'

    -- 'tpope/vim-dadbod', -- interact with DB
    -- 'kristijanhusak/vim-dadbod-ui',
    'tpope/vim-surround',
    -- use 'tpope/vim-markdown'
    -- use 'tpope/vim-obsession'
    -- use 'tpope/vim-dotenv'
    -- use 'tpope/vim-speeddating'
    -- use 'tpope/vim-repeat'

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    'voldikss/vim-floaterm',
    'renerocksai/telekasten.nvim',
    'renerocksai/calendar-vim',

    {
        "chrsm/impulse.nvim",
        config = function()
            require("impulse").setup({})
        end,
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    },

    'christoomey/vim-system-copy',
    'folke/which-key.nvim',

    'goolord/alpha-nvim',

    'lewis6991/impatient.nvim', -- Speed up loading Lua modules in Neovim to improve startup time.
    -- 'jbyuki/venn.nvim', -- draw ASCII

    'zbirenbaum/copilot.lua',

    -- 'jackMort/ChatGPT.nvim',
    -- 'MunifTanjim/nui.nvim',

    'windwp/nvim-spectre', -- search panel for NeoVim
    'mbbill/undotree',

    'jedrzejboczar/possession.nvim', -- session manager

    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    -- use 's1n7ax/nvim-window-picker'

    { 'Wansmer/treesj', requires = 'nvim-treesitter' }, -- split or join blocks of code

    { "cshuaimin/ssr.nvim", module = "ssr" }, -- structural search and replace
    -- 'simrat39/symbols-outline.nvim', -- tree like view/manager for symbols
    { 'barrett-ruth/import-cost.nvim', run = 'sh install.sh yarn' }, -- display the costs of javascript imports

    'dnlhc/glance.nvim', -- preview LSP locations (definition etc.)
    'xorid/swap-split.nvim', -- swap windows/panes
    -- use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' } -- handy pop-up menu for code actions

    -- use "rest-nvim/rest.nvim" -- http client written in Lua.

    -- Debugging

  --   {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --
  --     -- local Config = require("lazyvim.config")
  --     vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
  --
  --     -- for name, sign in pairs(Config.icons.dap) do
  --     --   sign = type(sign) == "table" and sign or { sign }
  --     --   vim.fn.sign_define(
  --     --     "Dap" .. name,
  --     --     { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  --     --   )
  --     -- end
  --
  --     for _, language in ipairs(js_based_languages) do
  --       dap.configurations[language] = {
  --         -- Debug single nodejs files
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Launch file",
  --           program = "${file}",
  --           cwd = vim.fn.getcwd(),
  --           sourceMaps = true,
  --         },
  --         -- Debug nodejs processes (make sure to add --inspect when you run the process)
  --         {
  --           type = "pwa-node",
  --           request = "attach",
  --           name = "Attach",
  --           processId = require("dap.utils").pick_process,
  --           cwd = vim.fn.getcwd(),
  --           sourceMaps = true,
  --         },
  --         -- Debug web applications (client side)
  --         {
  --           type = "pwa-chrome",
  --           request = "launch",
  --           name = "Launch & Debug Chrome",
  --           url = function()
  --             local co = coroutine.running()
  --             return coroutine.create(function()
  --               vim.ui.input({
  --                 prompt = "Enter URL: ",
  --                 default = "http://localhost:3000",
  --               }, function(url)
  --                 if url == nil or url == "" then
  --                   return
  --                 else
  --                   coroutine.resume(co, url)
  --                 end
  --               end)
  --             end)
  --           end,
  --           webRoot = vim.fn.getcwd(),
  --           protocol = "inspector",
  --           sourceMaps = true,
  --           userDataDir = false,
  --         },
  --         -- Divider for the launch.json derived configs
  --         {
  --           name = "----- ↓ launch.json configs ↓ -----",
  --           type = "",
  --           request = "launch",
  --         },
  --       }
  --     end
  --   end,
  --   keys = {
  --     {
  --       "<leader>dO",
  --       function()
  --         require("dap").step_out()
  --       end,
  --       desc = "Step Out",
  --     },
  --     {
  --       "<leader>do",
  --       function()
  --         require("dap").step_over()
  --       end,
  --       desc = "Step Over",
  --     },
  --     {
  --       "<leader>da",
  --       function()
  --         if vim.fn.filereadable(".vscode/launch.json") then
  --           local dap_vscode = require("dap.ext.vscode")
  --           dap_vscode.load_launchjs(nil, {
  --             ["pwa-node"] = js_based_languages,
  --             ["chrome"] = js_based_languages,
  --             ["pwa-chrome"] = js_based_languages,
  --           })
  --         end
  --         require("dap").continue()
  --       end,
  --       desc = "Run with Args",
  --     },
  --   },
  --   dependencies = {
  --     -- Install the vscode-js-debug adapter
  --     {
  --       "microsoft/vscode-js-debug",
  --       -- After install, build it and rename the dist directory to out
  --       build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
  --       version = "1.*",
  --     },
  --     {
  --       "mxsdev/nvim-dap-vscode-js",
  --       config = function()
  --         ---@diagnostic disable-next-line: missing-fields
  --         require("dap-vscode-js").setup({
  --           -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --           -- node_path = "node",
  --
  --           -- Path to vscode-js-debug installation.
  --           debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
  --
  --           -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
  --           -- debugger_cmd = { "js-debug-adapter" },
  --
  --           -- which adapters to register in nvim-dap
  --           adapters = {
  --             "chrome",
  --             "pwa-node",
  --             "pwa-chrome",
  --             "pwa-msedge",
  --             "pwa-extensionHost",
  --             "node-terminal",
  --           },
  --
  --           -- Path for file logging
  --           -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
  --
  --           -- Logging level for output to file. Set to false to disable logging.
  --           -- log_file_level = false,
  --
  --           -- Logging level for output to console. Set to false to disable console output.
  --           -- log_console_level = vim.log.levels.ERROR,
  --         })
  --       end,
  --     },
  --     {
  --       "Joakker/lua-json5",
  --       build = "./install.sh",
  --     },
  --   },
  -- },
  --
  --   -- "mason-nvim-dap.nvim",
  --   { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  --   -- { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} },
  --   'theHamsta/nvim-dap-virtual-text',
    -- {
    --   "microsoft/vscode-js-debug",
    --   opt = true,
    --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    -- },
    -- 'ravenxrz/DAPInstall.nvim',
    -- use 'Pocco81/dap-buddy.nvim'
    -- use 'David-Kunz/jester' -- jest
    "folke/todo-comments.nvim",

    { "anuvyklack/windows.nvim",
       dependencies = {
          "anuvyklack/middleclass",
          "anuvyklack/animation.nvim"
       },
       config = function()
          vim.o.winwidth = 10
          vim.o.winminwidth = 10
          vim.o.equalalways = false
          require('windows').setup()
       end
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        -- add any options here
        },
        dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
        }
    },
    "dstein64/nvim-scrollview",

})

-- require("noice").setup({})
-- require("windows")
