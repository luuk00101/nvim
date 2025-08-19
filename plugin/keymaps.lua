-- Lua
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- General
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")

-- Clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = true })

-- Lazy
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>")
