-- return {
-- 	"folke/trouble.nvim",
-- 	config = function()
-- 		require("trouble").setup({
-- 			icons = false,
-- 		})
--
-- 		vim.keymap.set("n", "<leader>tt", function()
-- 			require("trouble").toggle()
-- 		end)
--
-- 		vim.keymap.set("n", "C-j", function()
-- 			require("trouble").next({ skip_groups = true, jump = true })
-- 		end)
--
-- 		vim.keymap.set("n", "C-k", function()
-- 			require("trouble").previous({ skip_groups = true, jump = true })
-- 		end)
-- 	end,
-- }
return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>tL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},

	-- config = function()
	-- 	require("trouble").setup({
	-- 		icons = false,
	-- 	})
	--
	-- 	-- vim.keymap.set("n", "<leader>tt", function()
	-- 	-- 	require("trouble").toggle()
	-- 	-- end)
	--
	-- 	vim.keymap.set("n", "C-j", function()
	-- 		require("trouble").next({ skip_groups = true, jump = true })
	-- 	end)
	--
	-- 	vim.keymap.set("n", "C-k", function()
	-- 		require("trouble").previous({ skip_groups = true, jump = true })
	-- 	end)
	-- end,
}
