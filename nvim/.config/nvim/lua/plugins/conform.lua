return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
            format_on_save = function(bufnr)
                -- format on save only for specific  filetypes
                local fmt_filetypes = { "go", "rust" }
                if vim.tbl_contains(fmt_filetypes, vim.bo[bufnr].filetype) then
                    return { timeout_ms = 5000, lsp_format = "fallback" }
                end
                return
            end,
			formatters_by_ft = {
				-- c = { "clang-format" },
				-- cpp = { "clang-format" },
				-- lua = { "stylua" },
				go = { "gofmt" },
                rust = { "rustfmt" },
                python = { "ruff_organize_imports", "ruff_format" },
                -- for filetypes that don't have a specific formatter:
                ["_"] = { "trim_whitespace" }
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
