local icons = require("settings.icons")
local colors = require("plugin-config.lualine.colors")
local conditions = require("plugin-config.lualine.conditions")
local lualine_functions = require("plugin-config.lualine.functions")

return {
	mode = {
		function()
			return " " .. icons.misc.Mode .. " "
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
		source = lualine_functions.diff_source,
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
