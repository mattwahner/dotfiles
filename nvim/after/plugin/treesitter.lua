require'nvim-treesitter.configs'.setup {
	sync_install = false,
	ensure_installed = { "javascript", "typescript", "c", "lua", "rust" },
	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
