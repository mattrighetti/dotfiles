local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true, noremap = false })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode[A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]implementation')
    nmap('K', vim.lsp.buf.hover, '[H]over')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end

lsp.preset("recommended")

local servers = { 'pyright', 'gopls', 'rust_analyzer', 'lua_ls', 'denols' }
lsp.ensure_installed(servers)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, s in ipairs(servers) do
    lspconfig[s].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

lsp.setup()
