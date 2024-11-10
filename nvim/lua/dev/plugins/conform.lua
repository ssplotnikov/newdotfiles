return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				svelte = { "prettierd", stop_after_first = true },
				javascript = { "prettierd", stop_after_first = true },
				typescript = { "prettierd", stop_after_first = true },
				javascriptreact = { "prettierd", stop_after_first = true },
				typescriptreact = { "prettierd", stop_after_first = true },
				json = { "prettierd", stop_after_first = true },
				graphql = { "prettierd", stop_after_first = true },
				java = { "google-java-format" },
				kotlin = { "ktlint" },
				ruby = { "standardrb" },
				markdown = { "prettierd", stop_after_first = true },
				erb = { "htmlbeautifier" },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				proto = { "buf" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				toml = { "taplo" },
				css = { "prettierd", stop_after_first = true },
				scss = { "prettierd", stop_after_first = true },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
