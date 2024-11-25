
local neotest = require('neotest');

neotest.setup({
    adapters = {
        require('rustaceanvim.neotest'),
    }
})

vim.keymap.set('n', '<leader>tr', function() neotest.run.run() end)
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end)
vim.keymap.set('n', '<leader>ta', function() neotest.run.run({ suite = true }) end)
vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
vim.keymap.set('n', '<leader>to', function() neotest.output.open({ enter = true }) end)

