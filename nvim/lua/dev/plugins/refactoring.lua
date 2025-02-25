return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({
			prompt_func_return_type = {
				typescript = true,
				go = true,
				java = false,

				cpp = true,
				c = true,
			},
			prompt_func_param_type = {
				typescript = true,
				go = true,
				java = false,

				cpp = true,
				c = true,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = false, -- shows a message with information about the refactor on success
			-- i.e. [Refactor] Inlined 3 variable occurrences
		})
	end,
}
