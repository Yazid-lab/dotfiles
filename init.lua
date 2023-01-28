require("config")
--MAPPINGS
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { noremap = true, silent = true,desc = desc })
end

--setting the leader character
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<C-d>", "<C-d>zz", "scroll down half a page and center")
map("n", "<C-u>", "<C-u>zz",  "scroll up half a page and center")
map("n", "<Space>", "<NOP>", "unmapping the space bar")
map("n", "<leader>j", ":Ex<CR>", "Open the netrw menu")
map("n", "<leader>so", ":so %<cr>", "Source the current file")
map("n", "<C-s>", ":w<cr>", "Save the current file in normal mode")
map("i", "<C-s>", "<C-c>:w<cr>a",  "Save the current file in insert mode")
map("n", "<C-j>", "<C-w>j", "Move down pane")
map("n", "<C-k>", "<C-w>k",  "Move up pane")
map("n", "<C-l>", "<C-w>l", "Move left pane")
map("n", "<C-h>", "<C-w>h", "Move right pane")
map("n","<leader>v",":vsp<CR>","Split vertically")
map("n","<leader>h",":sp<CR>","Split horizontally")
map('n','<leader>x',':q<CR>','close buffer')
--general configs
local set = vim.opt
vim.wo.wrap = false
set.nu = true
set.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.o.completeopt = "menuone,noselect"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
