require("refactoring").setup({
	-- overriding printf statement for cpp
	print_var_statements = {
		-- add a custom print var statement for cpp
		cpp = {
			'printf("a custom statement %%s %s", %s)',
		},
		js = {
			"printf(%s)",
		},
		ts = {
			"printf(%s)",
		},
	},
})

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
-- Supports only normal mode

require("telescope").load_extension("refactoring")

vim.keymap.set({ "n", "x" }, "<leader>rr", function()
	require("telescope").extensions.refactoring.refactors()
end)
