local TREESITTER = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = "<cmd>TSUpdate",
}

function TREESITTER.config()
	local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
	if not treesitter_ok then
		return
	end

	treesitter.setup({
		ensure_installed = { "lua", "markdown", "markdown_inline" },
	})
end

return TREESITTER
