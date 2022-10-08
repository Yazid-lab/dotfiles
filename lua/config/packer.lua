return require("packer").startup(function()
	use("wbthomason/packer.nvim") --speed up loading
	use("lewis6991/impatient.nvim") -- speed up startup
	use("nathom/filetype.nvim")
	--colors
	--tokiooooooooooooooo
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rebelot/kanagawa.nvim")
	use("mortepau/codicons.nvim") -- dev icons
	use("lukas-reineke/indent-blankline.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context") --shows the function or class we're inside
	use("windwp/nvim-ts-autotag") -- hopefully makes autotag work
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	}) --this will pair parentheses and shit
	--telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	--lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	--devicons
	use({ "kyazdani42/nvim-web-devicons" })
	--lsp
	use("nvim-lua/plenary.nvim") -- some module that does shit
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("onsails/lspkind.nvim") --add vscode like pictograms and also list the source of the snippet
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("tpope/vim-fugitive") -- git commands inside nvim
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("tpope/vim-rhubarb") --Fugitive-companion to interact with github
	use("numToStr/Comment.nvim") -- plugin that managers commenting code Ex: "gc" to comment visual regions/lines
	use({ "williamboman/mason.nvim" }) -- manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("rafamadriz/friendly-snippets") --snippet collection
	use("jose-elias-alvarez/null-ls.nvim")
	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
end)
