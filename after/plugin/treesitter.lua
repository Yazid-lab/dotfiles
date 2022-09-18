require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "bash", "javascript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "go", "python" },
	},
})
require("nvim-ts-autotag").setup()
