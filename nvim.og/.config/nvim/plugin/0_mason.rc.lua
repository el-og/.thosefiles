local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

    ensure_installed = { "prettierd", "typescript_language_server", "css_lsp", "html_lsp", "lua_language_server" }
})

lspconfig.setup {
    automatic_installation = true
}
