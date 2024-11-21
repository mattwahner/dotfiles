return {
    'tpope/vim-fugitive',
    keys = function()
        return {
            { "<leader>gs", vim.cmd.Git }
        }
    end
}

