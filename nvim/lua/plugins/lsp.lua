return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"vim",
				"lua",
				"rust",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"html",
				"css",
				"bash",
				"python",
				"markdown",
				"markdown_inline",
				"terraform",
				"hcl",
				"go",
				"c",
				"cpp",
				"yaml",
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"rust-analyzer",
				"typescript-language-server",
				"bash-language-server",
				"pyright",
				"marksman",
				"terraform-ls",
				"gopls",
				"tailwindcss-language-server",
				"clangd",
			},
		},
	},
}
