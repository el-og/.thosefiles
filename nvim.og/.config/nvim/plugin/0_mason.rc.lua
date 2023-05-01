local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

    ensure_installed = { "eslint_d", "prettierd", "typescript_language_server", "css_lsp", "html_lsp", "terraformls",
        "tflint", "lua_language_server" }
})

lspconfig.setup {
    automatic_installation = true
}
