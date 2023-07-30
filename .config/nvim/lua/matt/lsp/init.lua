local lspconfig = require("lspconfig")

local nmap = require("matt.keymap").nmap
local imap = require("matt.keymap").imap

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_format = vim.api.nvim_create_augroup("custom-lsp-format", { clear = true })

local autocmd_format = function(async, filter)
  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format { async = async, filter = filter }
    end,
  })
end

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local buf_inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  imap(opts)
end

local filetype_attach = setmetatable({
  go = function()
    autocmd_format(false)
  end,

  scss = function()
    autocmd_format(false)
  end,

  css = function()
    autocmd_format(false)
  end,

  rust = function()
    autocmd_format(false)
  end,

  typescript = function()
    autocmd_format(false, function(client)
      return client.name ~= "tsserver"
    end)
  end,

  javascript = function()
    autocmd_format(false, function(client)
      return client.name ~= "tsserver"
    end)
  end,

  python = function()
    autocmd_format(false)
  end,

}, {
  __index == function()
    return function() end
  end,
})

local custom_attach = function(client, bufnr)
  local filetype = vim.api.nvim_bug_get_option(0, "filetype")

  buf_nnoremap { 'K', vim.lsp.buf.hover }
  buf_nnoremap { 'gd', vim.lsp.buf.definition }
  buf_nnoremap { 'gI', vim.lsp.buf.implementation }
  buf_nnoremap { 'gr', require('telescope.builtin').lsp_references }
  buf_nnoremap { '<leader>rn', vim.lsp.buf.rename }
  buf_nnoremap { '<leader>ca', vim.lsp.buf.code_action }
  buf_nnoremap { '<leader>D', vim.lsp.buf.type_definition }
  buf_nnoremap { '<leader>ds', require('telescope.builtin').lsp_document_symbols }
  buf_nnoremap { '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols }

  if filetype == "typescript" or filetype == "lua" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  filetype_attach[filetype]()
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- Completion configuration
vim.tbl_deep_extend("force", updated_capabilities, require("cmp_nvim_lsp").default_capabilities())
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

local rust_analyzer, rust_analyzer_cmd = nil, { "rustup", "run", "nightly", "rust-analyzer" }
local has_rt, rt = pcall(require, "rust-tools")
if has_rt then
  local extension_path = vim.fn.expand "~/.vscode/extensions/sadge-vscode/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

  rt.setup {
    server = {
      cmd = rust_analyzer_cmd,
      capabilities = updated_capabilities,
      on_attach = custom_attach,
    },
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
  }
else
  rust_analyzer = {
    cmd = rust_analyzer_cmd,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  }
end

local servers = {
  bashls = true,
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
        completion = { keyworkSnippet = "Disable" },
        workspace = {
          checkThirdParty = false,
        },
        diagnostics = {
          enable = true,
          -- Get the language server to recognize the `vim` global
          globals = { 'vim', 'use' },
        },
        telemetry = {
          enabled = false,
        },
      }
    },
  },

  eslint = true,
  html = true,
  pyright = true,
  yamlls = true,
  jsonls = true,

  gopls = {
    settings = {
      gopls = {
        codelenses = { test = true },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        } or nil,
      },
    },
  },

  rust_analyzer = rust_analyzer,

  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    on_attach = function(client)
      custom_attach(client)
      -- ts_util.setup { auto_inlay_hints = false }
      -- ts_util.setup_client(client)
    end,
  },
}


require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "jsonls" }
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
