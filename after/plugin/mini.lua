local icons = require("globals.icons")

require("mini.cursorword").setup({})
local map = require("mini.map")
map.setup({
	-- symbols = { encode = map.gen_encode_symbols.dot("4x2") },
})

require("mini.indentscope").setup({
	draw = {
		-- Delay (in ms) between event and start of drawing scope indicator
		delay = 100,

		-- Animation rule for scope's first drawing. A function which, given
		-- next and total step numbers, returns wait time (in ms). See
		-- |MiniIndentscope.gen_animation()| for builtin options. To disable
		-- animation, use `require('mini.indentscope').gen_animation('none')`.
		-- animation = --<function: implements constant 20ms between steps>,
		animation = require("mini.indentscope").gen_animation.quadratic({
			easing = "out",
			duration = 100,
			unit = "total",
		}),
	},

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Textobjects
		object_scope = "ii",
		object_scope_with_border = "ai",

		-- Motions (jump to respective border line; if not present - body line)
		goto_top = "[i",
		goto_bottom = "]i",
	},

	-- Options which control scope computation
	options = {
		-- Type of scope's border: which line(s) with smaller indent to
		-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
		border = "both",

		-- Whether to use cursor column when computing reference indent.
		-- Useful to see incremental scopes with horizontal cursor movements.
		indent_at_cursor = true,

		-- Whether to first check input line to be a border of adjacent scope.
		-- Use it if you want to place cursor on function header to get scope of
		-- its body.
		try_as_border = false,
	},

	-- Which character to use for drawing scope indicator
	symbol = icons.separator.fill_pipe,
})

require("mini.comment").setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = "gc",

		-- Toggle comment on current line
		comment_line = "<leader>cc",

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		textobject = "gc",
	},
	-- Hook functions to be executed at certain stage of commenting
	hooks = {
		-- Before successful commenting. Does nothing by default.
		pre = function() end,
		-- After successful commenting. Does nothing by default.
		post = function() end,
	},
})

require("mini.jump2d").setup({
	-- Function producing jump spots (byte indexed) for a particular line.
	-- For more information see |MiniJump2d.start|.
	-- If `nil` (default) - use |MiniJump2d.default_spotter|
	spotter = nil,

	-- Characters used for labels of jump spots (in supplied order)
	labels = "abcdefghijklmnopqrstuvwxyz",

	-- Which lines are used for computing spots
	allowed_lines = {
		blank = true, -- Blank line (not sent to spotter even if `true`)
		cursor_before = true, -- Lines before cursor line
		cursor_at = true, -- Cursor line
		cursor_after = true, -- Lines after cursor line
		fold = true, -- Start of fold (not sent to spotter even if `true`)
	},

	-- Which windows from current tabpage are used for visible lines
	allowed_windows = {
		current = true,
		not_current = true,
	},

	-- Functions to be executed at certain events
	hooks = {
		before_start = nil, -- Before jump start
		after_jump = nil, -- After jump was actually done
	},

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		start_jumping = ",",
	},
})

require("mini.pairs").setup({
	-- In which modes mappings from this `config` should be created
	modes = { insert = true, command = false, terminal = false },

	-- Global mappings. Each right hand side should be a pair information, a
	-- table with at least these fields (see more in |MiniPairs.map|):
	-- - <action> - one of 'open', 'close', 'closeopen'.
	-- - <pair> - two character string for pair to be used.
	-- By default pair is not inserted after `\`, quotes are not recognized by
	-- `<CR>`, `'` does not insert pair after a letter.
	-- Only parts of tables can be tweaked (others will use these defaults).
	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },

		[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
	},
})

require("mini.surround").setup({
	custom_surroundings = nil,

	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "ys", -- Add surrounding in Normal and Visual modes
		delete = "yd", -- Delete surrounding
		find = "yf", -- Find surrounding (to the right)
		find_left = "yF", -- Find surrounding (to the left)
		highlight = "yh", -- Highlight surrounding
		replace = "yr", -- Replace surrounding
		update_n_lines = "yn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},

	-- Number of lines within which surrounding is searched
	n_lines = 20,

	-- How to search for surrounding (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
	-- see `:h MiniSurround.config`.
	search_method = "cover",
})

require("mini.sessions").setup({
	-- Whether to read latest session if Neovim opened without file arguments
	autoread = false,

	-- Whether to write current session before quitting Neovim
	autowrite = true,

	directory = "~/.local/share/nvim/session",
	-- Whether to force possibly harmful actions (meaning depends on function)
	force = { read = true, write = true, delete = false },

	-- Hook functions for actions. Default `nil` means 'do nothing'.
	hooks = {
		-- Before successful action
		pre = { read = nil, write = nil, delete = nil },
		-- After successful action
		post = { read = nil, write = nil, delete = nil },
	},

	-- Whether to print session path after action
	verbose = { read = true, write = true, delete = true },
})

require("mini.ai").setup({})

require("mini.move").setup({})

-- Mappings
vim.keymap.set("n", "<leader>mpt", map.toggle)
