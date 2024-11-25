
local mini_files = require("mini.files")
vim.keymap.set("n", "<leader>o", function()
    local current_file = vim.api.nvim_buf_get_name(0)
    local starter = "/Starter"
    if current_file:sub(-#starter) == starter then
        mini_files.open()
    else
        mini_files.open(vim.api.nvim_buf_get_name(0), false)
    end
end)

