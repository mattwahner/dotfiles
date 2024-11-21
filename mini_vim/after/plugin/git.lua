
local neogit = require('neogit')
neogit.setup({
    mappings = {
        commit_editor = {
            ["<esc>"] = "Close"
        },
        rebase_editor = {
            ["<esc>"] = "Close"
        },
        finder = {
            ["<esc>"] = "Close"
        },
        status = {
            ["<esc>"] = "Close"
        }
    }
})
local gitsigns = require('gitsigns')
gitsigns.setup()

vim.keymap.set('n', '<leader>gs', function() neogit.open({ kind = "floating" }) end)
vim.keymap.set('n', '<leader>gp', function() neogit.open({ 'pull', kind = "floating" }) end)
vim.keymap.set('n', '<leader>gr', function() neogit.open({ 'rebase', kind = "floating" }) end)
vim.keymap.set('n', '<leader>gP', function() neogit.open({ 'push', kind = "floating" }) end)

vim.keymap.set('n', '<leader>hn', function() gitsigns.nav_hunk('next') end)
vim.keymap.set('n', '<leader>hp', function() gitsigns.nav_hunk('prev') end)
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('n', '<leader>hv', gitsigns.preview_hunk)

