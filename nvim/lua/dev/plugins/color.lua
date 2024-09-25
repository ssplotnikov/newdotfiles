function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#171717" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#171717" })
end

return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			disable_background = true,
			styles = {
				italic = false,
			},
		})

		ColorMyPencils()
	end,
}
