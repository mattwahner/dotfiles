
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

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
        go_in_plus = "<CR>",
        go_in = ";",
        go_out = "j"
    }
}) end)

now(function() require('mini.icons').setup() end)
now(function() require('mini.pairs').setup() end)
now(function() require('mini.statusline').setup() end)

add({ source = 'NeogitOrg/neogit' })
add({ source = 'sindrets/diffview.nvim' })
add({ source = 'lewis6991/gitsigns.nvim' })

add({ source = 'MunifTanjim/nui.nvim' })
add({ source = 'folke/trouble.nvim' })

if os.getenv('NVIM_ENABLE_AI') ~= nil then
    add({ source = 'jackMort/ChatGPT.nvim' })
    -- add({ source = 'github/copilot.vim' })
end

add({ source = 'antoinemadec/FixCursorHold.nvim' })
add({ source = 'nvim-neotest/nvim-nio' })
add({ source = 'nvim-neotest/neotest' })
add({ source = 'mrcjkb/rustaceanvim' })

add({ source = 'mfussenegger/nvim-dap' })
add({ source = 'rcarriga/nvim-dap-ui' })
add({ source = 'theHamsta/nvim-dap-virtual-text' })

