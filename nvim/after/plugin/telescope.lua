
local telescope = require('telescope')
telescope.setup({
    defaults = {
        file_ignore_patterns = {
            'node_modules'
        }
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fp', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find Old Files' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find Marks' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })

vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = 'Find Branches' })
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, { desc = 'Find Commits' })
vim.keymap.set('n', '<leader>fgs', builtin.git_stash, { desc = 'Find Stash' })

vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'Find Definitions' })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'Find Implementations' })
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, { desc = 'Find Type Implementations' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find References' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find Document Symbols' })
vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, { desc = 'Find Workspace Symbols' })

