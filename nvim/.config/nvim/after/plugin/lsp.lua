local lsp = require('lsp-zero')

lsp.preset({
    name = 'minimal';
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false
})
-- lsp.nvim_workspace()

-- These names come from here
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
lsp.setup_servers({
    'clangd',
    'pyright',
    'lua_ls',
    'nixd',
    'ts_ls',
    'zls',
})

lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
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
