
local dap = require('dap')

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>do', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>du', dap.step_out)
vim.keymap.set('n', '<leader>ds', dap.terminate)

local dapui = require('dapui')

dapui.setup()

vim.keymap.set('n', '<leader>dd', dapui.toggle)
vim.keymap.set('n', '<leader>de', function() dapui.eval(nil, { enter = true }) end)
vim.keymap.set('n', '<leader>dr', function() dapui.float_element('repl', { enter = true }) end)

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})

require('nvim-dap-virtual-text').setup()

-- ########## Typescript ##########
-- https://github.com/ecosse3/nvim/blob/master/lua/plugins/dap.lua
-- https://www.lazyvim.org/extras/lang/typescript
-- ^ helpful links

local data_path = vim.fn.stdpath('data')
local js_debug_path = data_path .. '/mason/packages/js-debug-adapter'
local js_dap_path = js_debug_path .. '/js-debug/src/dapDebugServer.js'

dap.adapters['pwa-node'] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
        command = 'node',
        args = {
            js_dap_path, '${port}'
        }
    }
}

dap.configurations.typescript = {
    {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch NPM Start',
        cwd = '${workspaceFolder}',
        protocol = 'inspector',
        sourceMaps = true,
        runtimeExecutable = 'npm',
        runtimeArgs = { 'start' },
    },
    {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
        sourceMaps = true,
    }
}

