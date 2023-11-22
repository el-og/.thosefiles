local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

-- luasnip setup
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = "cmp_luasnip" },
        { name = "cmp_cmdline" },
        -- { name = "tmux" },
        { name = "env" },
        { name = "nerdfont" },
        { name = "nvim_lua" },
        -- { name = "terraformls" },
        { name = "treesitter" },
        -- { name = "vim-dadbod-completion" },
        -- { name = "cmp-tw2css" },
        -- { name = "cmp_tabnine" },
        { name = "path" },
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
    }

})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- local on_attach = function(client, bufnr)
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--
--     --Enable completion triggered by <c-x><c-o>
--     --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--     --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--     -- Mappings.
--     local opts = { noremap = true, silent = true }
--
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- end


-- -- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

-- terraform
nvim_lsp.terraformls.setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "terraform" },
    cmd = { "terraform-ls", "serve" }
}


-- nvim_lsp.sumneko_lua.setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         -- on_attach(client, bufnr)
--         enable_format_on_save(client, bufnr)
--     end,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false
--             },
--         },
--     },
-- }

-- -- Prisma setup
-- nvim_lsp.prismals.setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         -- on_attach(client, bufnr)
--         enable_format_on_save(client, bufnr)
--     end,
--     cmd = { "prisma-language-server", "--stdio" }
-- }

-- nvim_lsp.ember.setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         -- on_attach(client, bufnr)
--         enable_format_on_save(client, bufnr)
--     end,
--     filetypes = { "handlebars", "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
--     cmd = { "ember-language-server", "--stdio" }
-- }

nvim_lsp.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities
}



-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
