-- require("tokyonight").setup({
-- 	-- your configuration comes here
-- 	-- or leave it empty to use the default settings
-- 	style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
-- 	transparent = true, -- Enable this to disable setting the background color
-- 	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
-- 	styles = {
-- 		-- Style to be applied to different syntax groups
-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 		comments = { italic = true },
-- 		keywords = { italic = true },
-- 		functions = {},
-- 		variables = {},
-- 		-- Background styles. Can be "dark", "transparent" or "normal"
-- 		sidebars = "transparent", -- style for sidebars, see below
-- 		floats = "dark", -- style for floating windows
-- 	},
-- 	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
-- 	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
-- 	dim_inactive = true, -- dims inactive windows
-- 	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
--
-- 	--- You can override specific color groups to use other groups or a hex color
-- 	--- function will be called with a ColorScheme table
-- })
-- vim.cmd("color tokyonight")
require("catppuccin").setup({
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	color_overrides = {},
	custom_highlights = {},
})
vim.cmd([[colorscheme catppuccin]])
local hl = function(thing, opts)
	vim.api.nvim_set_hl(0, thing, opts)
end
hl("ColorColumn", {
	ctermbg = 0,
	bg = "#555555",
})

hl("CursorLineNR", {
	bg = "None",
})

hl("LineNr", {
	fg = "#5eacd3",
})

hl("netrwDir", {
	fg = "#5eacd3",
})
