vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
    end
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'phpactor',
        'tsserver',
        'eslint',
        'html',
    }
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,
})
