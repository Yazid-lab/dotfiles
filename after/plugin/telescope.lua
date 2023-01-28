
--MAPPINGS
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { noremap = true, silent = true,desc = desc })
end


--telescope keybindings
map("n", "<leader>ff" , require('telescope.builtin').find_files, 'Telescope files')
map("n", "<leader>km",  require('telescope.builtin').keymaps, 'Telescope keymaps')
map("n", "<leader>gc", require('telescope.builtin').git_commits, 'Telescope git commits')
map("n","<leader>fg", require('telescope.builtin').live_grep, 'Telescope this word')
map("n","<leader>mm", require('telescope.builtin').man_pages, 'Telescope man pages')
map("n","<leader>gs", require('telescope.builtin').git_status, 'Telescope git status')
map("n","<leader>bf", require('telescope.builtin').current_buffer_fuzzy_find, 'Telescope fuzzy find over the current buffer')
