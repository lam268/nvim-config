require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sw", "<cmd> Telescope live_grep<cr>")
map({"n", "i"}, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>fe", "<cmd> NvimTreeToggle<cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
