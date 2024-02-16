local CONFORM = {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
}

function CONFORM.config()
	local conform_ok, conform = pcall(require, "conform")
	if not conform_ok then
		return
	end

	conform.setup({
		format_on_save = {
			timeout_ms = 100,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			markdown = { "cbfmt" },
		},
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePre" }, {
			group = "CustomBuffer",
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		}),
	})
end

return CONFORM