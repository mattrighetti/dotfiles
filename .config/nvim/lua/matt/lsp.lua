local lspconfig = require("lspconfig")
if not lspconfig then
  return
end

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
  __index = function()
    return function() end
  end,
})


local custom_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  buf_inoremap { "<c-s>",      vim.lsp.buf.signature_help }

  buf_nnoremap { 'K',          vim.lsp.buf.hover, { desc = "lsp:hover" } }
  buf_nnoremap { '<leader>sh', vim.lsp.buf.signature_help }
  buf_nnoremap { 'gd',         vim.lsp.buf.definition }
  buf_nnoremap { 'gI',         vim.lsp.buf.implementation }
  buf_nnoremap { '<leader>rn', vim.lsp.buf.rename }
  buf_nnoremap { '<leader>ca', vim.lsp.buf.code_action }
  buf_nnoremap { '<leader>D',  vim.lsp.buf.type_definition }

  buf_nnoremap { 'gr',         require('telescope.builtin').lsp_references }
  buf_nnoremap { '<leader>ds', require('telescope.builtin').lsp_document_symbols }
  buf_nnoremap { '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols }

  filetype_attach[filetype]()
end

-- Old Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local rust_analyzer, rust_analyzer_cmd = nil, { "rustup", "run", "nightly", "rust-analyzer" }
local has_rt, rt = pcall(require, "rust-tools")
if has_rt then
  rt.setup {
    server = {
      cmd = rust_analyzer_cmd,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
      capabilities = capabilities,
      on_attach = custom_attach,
    },
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
  }

  rust_analyzer = rt
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
  volar = true,

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
    end,
  },
}


require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "jsonls", "gopls" }
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
    capabilities = capabilities,
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = capabilities,
}
