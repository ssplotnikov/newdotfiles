return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	lazy = true,
	config = function()
		local ls = require("luasnip")

		ls.config.setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})

		ls.filetype_extend("javascript", { "jsdoc" })
		ls.filetype_extend("javascript", { "tsdoc" })
		ls.filetype_extend("javascript", { "luadoc" })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		-- 	paths = { vim.fn.stdpath("config") .. "/snippets" },
		-- })

		require("dev.utils.snippets")
	end,
}
