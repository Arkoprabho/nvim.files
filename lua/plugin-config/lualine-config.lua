local icons = require("settings.icons")
local location_color = "SLBranchName"

local window_width_limit = 1000
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.o.columns > window_width_limit
	end,
	-- check_git_workspace = function()
	--   local filepath = vim.fn.expand "%:p:h"
	--   local gitdir = vim.fn.finddir(".git", filepath .. ";")
	--   return gitdir and #gitdir > 0 and #gitdir < #filepath
	-- end,
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local colors = {
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local lualine_components = {
	mode = {
		function()
			return "  "
		end,
		padding = { left = 0, right = 0 },
		color = {},
		cond = nil,
	},
	branch = {
		"b:gitsigns_head",
		icon = icons.git.Branch,
		color = { gui = "bold" },
	},
	filename = {
		"filename",
		color = {},
		cond = nil,
	},
	diff = {
		"diff",
		source = diff_source,
		symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " },
		padding = { left = 2, right = 1 },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		cond = nil,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
		-- cond = conditions.hide_in_width,
	},
	lsp_progress = {
		"lsp_progress",
		colors = {
			percentage = colors.blue,
			title = colors.blue,
			message = colors.blue,
			spinner = colors.blue,
			lsp_client_name = colors.green,
			use = true,
		},
		separators = {
			component = " ",
			progress = " | ",
			message = { pre = "(", post = ")" },
			percentage = { pre = "", post = "%% " },
			title = { pre = "", post = ": " },
			lsp_client_name = { pre = "[", post = "]" },
			spinner = { pre = "", post = "" },
		},
		display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
		timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
		-- spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
		message = { commenced = "In Progress", completed = "Completed" },
		max_message_length = 30,
	},
	treesitter = {
		function()
			return ""
		end,
		color = function()
			local buf = vim.api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
		end,
		cond = conditions.hide_in_width,
	},
	location = { "location" },
	progress = {
		"progress",
		fmt = function()
			return "%P/%L"
		end,
		color = {},
	},

	spaces = {
		function()
			local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
			return " " .. shiftwidth
		end,
		separator = icons.separator.hollow_left,
		padding = 1,
	},
	encoding = {
		"o:encoding",
		fmt = string.upper,
		color = {},
		cond = conditions.hide_in_width,
	},
	filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
	scrollbar = {
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 0, right = 0 },
		color = "SLProgress",
		cond = nil,
	},
}
require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	extensions = {
		"nvim-tree",
		"toggleterm",
	},
	sections = {
		lualine_a = { lualine_components.mode },
		lualine_b = { lualine_components.branch, lualine_components.diff },
		lualine_c = { lualine_components.filename, lualine_components.lsp_progress },
		lualine_x = {
			lualine_components.spaces,
			lualine_components.filetype,
		},
		lualine_y = { lualine_components.progress },
		lualine_z = { lualine_components.location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
