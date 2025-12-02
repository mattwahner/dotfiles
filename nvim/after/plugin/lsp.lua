require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'ts_ls',
        'bashls',
        'pyright',
        'marksman',
        'terraformls',
        'gopls',
        'tailwindcss',
        'clangd'
    },
}

vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_clients())<cr>')

vim.opt.signcolumn = 'yes'
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
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
		vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('n', 'gv', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
		vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({'n', 'x'}, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	end,
})

require('lspconfig').ts_ls.setup({
    init_options = {
        preferences = {
            importModuleSpecifierPreference = 'relative',
            importModuleSpecifierEnding = 'minimal'
        }
    }
})

require('lspconfig').lua_ls.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').marksman.setup({})
require('lspconfig').terraformls.setup({
    init_options = {
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "terraform-vars" }
    }
})
require('lspconfig').gopls.setup({})
require('lspconfig').tailwindcss.setup({})
require('lspconfig').clangd.setup({})

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
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

