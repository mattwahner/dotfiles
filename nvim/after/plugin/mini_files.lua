
local mini_files = require("mini.files")
vim.keymap.set("n", "<leader>o", function()
    mini_files.open(vim.api.nvim_buf_get_name(0), false)
    mini_files.reveal_cwd()
end)

