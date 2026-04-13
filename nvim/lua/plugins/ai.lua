return {
	{
		"yetone/avante.nvim",
		lazy = false,
		opts = {
			selector = {
				provider = "snacks",
			},
			input = {
				provider = "snacks",
			},
		},
		keys = {
			{ mode = { "n", "x" }, "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Avante Ask" },
			{ mode = { "n", "x" }, "<leader>an", "<cmd>AvanteChatNew<cr>", desc = "Avante Ask New Chat" },
			{ mode = { "n", "x" }, "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Avante Edit" },
		},
	},
}
