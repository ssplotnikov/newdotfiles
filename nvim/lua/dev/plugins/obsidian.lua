return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "/media/dev/d29ffa2a-5acc-4bc1-aace-05f136c51918/vegapunk/Documents/Obsidian",
			},
		},
	},
}
