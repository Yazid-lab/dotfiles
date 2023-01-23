
--MAPPINGS
local map = vim.keymap.set


--telescope keybindings
map("n", "<leader>ff" , require('telescope.builtin').find_files, {desc = 'telescope files'})
map("n", "<leader>hh", require('telescope.builtin').help_tags,{desc = 'telescope help'})
map("n", "<leader>km",  require('telescope.builtin').keymaps, {desc = 'telescope keymaps'})
map("n", "<leader>gc", require('telescope.builtin').git_commits, {desc = 'telescope git commits'})
map("n","<leader>fg", require('telescope.builtin').live_grep, {desc = 'telescope this word'})
map("n","<leader>mm", require('telescope.builtin').man_pages, {desc = 'telescope man pages'})
map("n","<leader>gs", require('telescope.builtin').git_status, {desc = 'telescope git status'})
map("n","<leader>bf", require('telescope.builtin').current_buffer_fuzzy_find, {desc = 'telescope fuzzy find over the current buffer'})
