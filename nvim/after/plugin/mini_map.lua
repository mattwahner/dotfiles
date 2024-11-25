
local mini_map = require('mini.map')

mini_map.setup({
    integrations = {
        mini_map.gen_integration.gitsigns()
    },
    symbols = {
        encode = mini_map.gen_encode_symbols.dot('4x2')
    },
    window = {
        show_integration_count = false
    }
})

mini_map.open()

vim.keymap.set('n', '<leader>mm', mini_map.toggle)

