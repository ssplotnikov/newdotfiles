-- return {
--     "nvim-telescope/telescope.nvim",
--
--     tag = "0.1.5",
--
--     dependencies = {
--         "nvim-lua/plenary.nvim"
--     },
--
--     config = function()
--         require('telescope').setup({})
--
--         local builtin = require('telescope.builtin')
--         vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--         vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--         vim.keymap.set('n', '<leader>pws', function()
--             local word = vim.fn.expand("<cword>")
--             builtin.grep_string({ search = word })
--         end)
--         vim.keymap.set('n', '<leader>pWs', function()
--             local word = vim.fn.expand("<cWORD>")
--             builtin.grep_string({ search = word })
--         end)
--         vim.keymap.set('n', '<leader>ps', function()
--             builtin.grep_string({ search = vim.fn.input("Grep > ") })
--         end)
--         vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
--     end
-- }

return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			return {
				{ ";?", builtin.oldfiles },
				{ ";l", builtin.buffers },
				{ ";/", builtin.current_buffer_fuzzy_fin },
				{ "gr", builtin.lsp_references },
				{ ";sf", builtin.find_files },
				{ ";sl", builtin.live_grep },
				{ ";gf", builtin.git_files },
				{ ";sk", builtin.keymaps },
				{
					";wt",
					function()
						telescope.extensions.git_worktree.git_worktrees()
					end,
				},
				{ ";sd", builtin.diagnostics },
				{ ";sh", builtin.help_tags },
				{ ";sc", builtin.colorscheme },
				{ ";ss", builtin.search_history },
				{ "<leader>ds", builtin.lsp_document_symbols },
				{ "<leader>ws", builtin.lsp_dynamic_workspace_symbols },
				{
					"sf",
					function()
						telescope.extensions.file_browser.file_browser({
							path = "%:p:h",
							hidden = true,
							respect_gitignore = false,
						})
					end,
				},
				{
					";;",
					function()
						telescope.extensions.resume.resume()
					end,
				},
				{
					";f",
					function()
						builtin.find_files({ no_ignore = true, hidden = true })
					end,
				},
				{
					";se",
					function()
						builtin.diagnostics({ bufnr = 0 })
					end,
				},
				{
					";cd",
					function()
						builtin.find_files({ cwd = require("telescope.utils").buffer_dir() })
					end,
				},
				{
					";sg",
					function()
						builtin.grep_string({ search = vim.fn.input("Grep > ") })
					end,
				},
				{
					";sw",
					function()
						builtin.grep_string({ search = vim.fn.expand("<cword>") })
					end,
				},
				{
					";sW",
					function()
						builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
					end,
				},
			}
		end,
		cmd = "Telescope",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local themes = require("telescope.themes")
			local fb_actions = telescope.extensions.file_browser.actions

			telescope.setup({
				defaults = {
					theme = "center",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							width = 0.9,
							preview_width = 0.4,
						},
					},
				},
				extensions = {
					["ui-select"] = { themes.get_dropdown() },
					file_browser = {
						hijack_netrw = false,
						mappings = {
							["i"] = {
								["<C-p>"] = actions.move_selection_previous,
							},
							["n"] = {
								["C"] = fb_actions.create,
								["R"] = fb_actions.rename,
								["h"] = fb_actions.goto_parent_dir,
							},
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
		end,
	},
}
