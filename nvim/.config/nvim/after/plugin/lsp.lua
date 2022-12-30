local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'pyright'
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select}
local cmd_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
})
lsp.setup()
