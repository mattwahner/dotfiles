
-- https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim.html

local mason = {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
}

local nvim_lspconfig = {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        mason,
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason-lspconfig.nvim'},
    },
    init = function()
        vim.opt.signcolumn = 'yes'
    end,
    config = function()
        local lsp_defaults = require('lspconfig').util.default_config
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {buffer = event.buf}

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'rust_analyzer',
                'denols',
                'lua_ls',
                'bashls'
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })

        require('lspconfig').rust_analyzer.setup {}
        require('lspconfig').denols.setup({})
        require('lspconfig').lua_ls.setup({})
        require('lspconfig').bashls.setup({
            filetypes = { "sh", "bash", "zsh", "zshrc" }
        })
    end
}

local nvim_cmp = {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = { nvim_lspconfig },
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true })
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })
    end
}

return {
    mason,
    nvim_cmp,
    nvim_lspconfig
}

