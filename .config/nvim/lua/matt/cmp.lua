local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  mappings = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
  }),
})
