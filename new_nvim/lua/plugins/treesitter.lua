return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                sync_install = false,
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "rust",
                    "html",
                    "vim",
                    "vimdoc"
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
}

