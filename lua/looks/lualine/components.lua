local icons = require("settings.icons")
local colors = require("looks.lualine.colors")
local conditions = require("looks.lualine.conditions")
local lualine_functions = require("looks.lualine.functions")

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
	lsp = {
		function(msg)
			msg = msg or "LS Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "LS Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			-- add formatter
			local formatters = require("lvim.lsp.null-ls.formatters")
			local supported_formatters = formatters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			-- add linter
			local linters = require("lvim.lsp.null-ls.linters")
			local supported_linters = linters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)

			local unique_client_names = vim.fn.uniq(buf_client_names)
			return "[" .. table.concat(unique_client_names, ", ") .. "]"
		end,
		separator = icons.separator.hollow_left,
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
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
