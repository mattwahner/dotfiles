
local path_package = vim.fn.stdpath('data') .. '/site/'
require('mini.deps').setup({ path = { package = path_package } })

local add, now = MiniDeps.add, MiniDeps.now

add({ source = 'folke/tokyonight.nvim' })
vim.cmd('colorscheme tokyonight')

add({ source = 'nvim-lua/plenary.nvim' })
add({
    source = 'nvim-telescope/telescope.nvim',
    tag = '0.1.8'
})
-- I build this in the docker file
add({ source = 'nvim-telescope/telescope-fzf-native.nvim' })

add({ source = 'nvim-treesitter/nvim-treesitter' })

add({ source = 'theprimeagen/harpoon' })

add({ source = 'williamboman/mason.nvim' })
add({ source = 'williamboman/mason-lspconfig.nvim' })
add({ source = 'hrsh7th/nvim-cmp' })
add({ source = 'hrsh7th/cmp-nvim-lsp' })
add({ source = 'neovim/nvim-lspconfig' })

now(function() require('mini.files').setup({
    mappings = {
        close = "<ESC>",
        go_in_plus = "<CR>"
    }
}) end)

now(function() require('mini.icons').setup() end)
now(function() require('mini.pairs').setup() end)
now(function() require('mini.statusline').setup() end)

add({ source = 'NeogitOrg/neogit' })
add({ source = 'sindrets/diffview.nvim' })
add({ source = 'lewis6991/gitsigns.nvim' })

