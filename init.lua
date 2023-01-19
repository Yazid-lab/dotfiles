require("config")
--MAPPINGS
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--setting the leader character
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n","<C-d>","<C-d>zz",opts)
map("n","<C-u>","<C-u>zz",opts)
map("n", "<Space>", "<NOP>", opts)
map("n", "<leader>j", ":Ex<CR>", opts)
map("n", "<leader>so", ":so %<cr>", opts)
map("n", "<C-s>", ":w<cr>", opts)
map("i", "<C-s>", "<C-c>:w<cr>a", opts)
map("n","<C-j>","<C-w>j",opts)
map("n","<C-k>","<C-w>k",opts)
map("n","<C-l>","<C-w>l",opts)
map("n","<C-h>","<C-w>h",opts)
--general configs
local set = vim.opt
vim.wo.wrap = false
set.nu = true
set.relativenumber = true
-- vim.opt.expandtab = true
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
