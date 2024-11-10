vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-r>", "hy:%s/<C-r>h//gc<left><left><left>")
vim.keymap.set("n", "<leader>to", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set("n", "<leader>rp", function()
	require("refactoring").debug.printf({ below = false })
end)

-- Print var

vim.keymap.set({ "x", "n" }, "<leader>rv", function()
	require("refactoring").debug.print_var()
end)
-- Supports both visual and normal mode

vim.keymap.set("n", "<leader>rc", function()
	require("refactoring").debug.cleanup({})
end)

vim.keymap.set("n", "gs", ":%s//g<Left><Left>")
vim.keymap.set("v", "gs", ":s//g<Left><Left>")
-- vim.keymap.set("n", "ti", "<cmd>TSToolsAddMissingImports<CR>")
