local PLUG = {
	"nvim-lualine/lualine.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	event = { "BufReadPost", "BufNewFile" },
}

function PLUG.config()
	-- Eviline config for lualine
	-- Author: shadmansaleh
	-- Credit: glepnir
	local lualine_ok, lualine = pcall(require, "lualine")
	if not lualine_ok then
		return
	end
	local icons_ok, icons = pcall(require, "core.icons")
	if not icons_ok then
		return
	end
	local IL = icons.lualine
	local GIT = icons.git

  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#FFFFFF',
    fg       = '#bbc2cf',
    white    = '#000000',
  }

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x at right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return IL.vert
		end,
		color = { fg = colors.bg },
		padding = { left = 1 },
	})

	ins_left({
		"branch",
		icon = GIT.branch,
		color = { fg = colors.white },
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.white },
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_right({
		"location",
		color = { fg = colors.white },
	})

	ins_right({
		"progress",
		color = { fg = colors.white },
	})

	ins_right({
		function()
			return IL.vert
		end,
		color = { fg = colors.bg },
		padding = { left = 1 },
	})

	-- Now don't forget to initialize lualine
	lualine.setup(config)
	vim.cmd("set laststatus=3")
end
return PLUG
