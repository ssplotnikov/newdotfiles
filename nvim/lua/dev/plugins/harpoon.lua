return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
			vim.keymap.set("n", string.format("<space>%d", idx), function()
				harpoon:list():select(idx)
			end)
		end
		-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
	end,
}
