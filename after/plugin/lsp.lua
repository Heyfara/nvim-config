local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
    'lua_ls',
    'tsserver',
    'eslint',
    'html',
    'phpactor',
})

lsp.configure("yamlls", {
    settings = {
        yaml = {
            keyOrdering = false
        }
    }
})

lsp.setup()

require('lspconfig').phpactor.setup({})

local cmp = require('cmp')
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
})

vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
