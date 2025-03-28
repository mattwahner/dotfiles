
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Use jkl; to move
-- vim.keymap.set({"n", "v"}, "-", ";", { noremap = true })
-- vim.keymap.set({"n", "v"}, ";", "l", { noremap = true })
-- vim.keymap.set({"n", "v"}, "l", "k", { noremap = true })
-- vim.keymap.set({"n", "v"}, "k", "j", { noremap = true })
-- vim.keymap.set({"n", "v"}, "j", "h", { noremap = true })

-- Use to move highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Jumping while staying centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- God paste, keeps it in the "buffer"
vim.keymap.set("x", "<leader>p", "\"_dp")

-- Get things to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

vim.keymap.set("n", "<leader>vv", "<cmd>vsplit<cr>")

