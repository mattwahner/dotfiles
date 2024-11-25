
require('mini.comment').setup({
    options = {
        ignore_blank_lines = true
    },
    mappings = {
        -- Bound to Ctrl + /
        comment = "<C-_>",
        comment_line = "<C-_>",
        comment_visual= "<C-_>"
    }
})

