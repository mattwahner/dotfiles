
if os.getenv('NVIM_ENABLE_AI') ~= nil then
    require('chatgpt').setup({
        yank_register = '"'
    })

    vim.keymap.set('n', '<leader>cc', '<cmd>ChatGPT<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>ce', '<cmd>ChatGPTEditWithInstructions<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>ca', '<cmd>ChatGPTRun add_tests<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>co', '<cmd>ChatGPTRun optimize_code<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>cf', '<cmd>ChatGPTRun fix_bugs<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>cx', '<cmd>ChatGPTRun explain_code<CR>')
end

