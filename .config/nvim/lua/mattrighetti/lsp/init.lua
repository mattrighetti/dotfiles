local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
    return
end

require("nvim-lsp-installer").setup {
    automatic_installation = false,
    ensure_installed = { "sumneko_lua", "pyright", "gopls", "rust-analyzer", "tsserver" }
}

local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    lspconfig[server].setup(config)
end

local servers = {
    pyright = true,
    yamlls = true,
    sumneko_lua = true,
    jdtls = true,

    rust_analyzer = {
        cmd = { "rustup", "run", "rust-analyzer" },
    },

    tsserver = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx"
        },
    },

    cssls = true
}

for server, config in pairs(servers) do
  setup_server(server, config)
end

