return {
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.diff",
		version = "*",
		config = function()
			require("mini.diff").setup()
		end,
	},
}
