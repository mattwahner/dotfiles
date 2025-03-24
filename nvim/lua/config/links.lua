
vim.keymap.set("n", "<leader>lg", function () 
    local github_base = os.getenv("GITHUB_BASE")
    local cwd = string.match(vim.fn.getcwd(), "/([^/]+)$")
    vim.cmd('silent !open https://github.com/' .. github_base .. '/' .. cwd)
end)

