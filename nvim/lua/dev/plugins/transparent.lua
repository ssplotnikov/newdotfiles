return {
	"xiyaowong/transparent.nvim",

	config = function()
		require("transparent").setup({
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"BufWinEnter",
				"EndOfBuffer",
			},
			extra_groups = {
				"NormalFloat",
				"NormalNC",
				"TelescopeNormal",
				"HarpoonWindow",
				"HarpoonBorder",
			}, -- table: additional groups that should be cleared
			exclude_groups = {},
		})
	end,
}
