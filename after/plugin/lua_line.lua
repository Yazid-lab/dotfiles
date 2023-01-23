local function fg(name)
	return function()
		---@type {foreground?:number}?
		local hl = vim.api.nvim_get_hl_by_name(name, true)
		return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
			-- stylua: ignore
			{
				function() return require("nvim-navic").get_location() end,
				cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
			},
		},
		lualine_x = {
			-- stylua: ignore
			{
				function() return require("noice").api.status.command.get() end,
				cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
				color = fg("Statement")
			},
			-- stylua: ignore
			{
				function() return require("noice").api.status.mode.get() end,
				cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
				color = fg("Constant"),
			},
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},
		lualine_y = {
			{ "progress", separator = "", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
