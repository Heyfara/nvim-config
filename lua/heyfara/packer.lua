local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Color theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Custom status line
    use {
        'freddiehaddad/feline.nvim',
        requires = {
            'lewis6991/gitsigns.nvim'
        },
    }

    -- Languages grammar
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Native LSP config
    use { 'neovim/nvim-lspconfig' }
    -- Auto install LSP servers
    use {
        'williamboman/mason.nvim',
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use { 'williamboman/mason-lspconfig.nvim' }
    -- LSP autocomplete
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }

    -- Twig syntax highlighting
    use { 'lumiliet/vim-twig' }

    -- DAP
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
