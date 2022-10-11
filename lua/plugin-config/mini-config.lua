local icons = require("settings.icons")
require("mini.indentscope").setup({
	draw = {
		-- Delay (in ms) between event and start of drawing scope indicator
		delay = 100,

		-- Animation rule for scope's first drawing. A function which, given
		-- next and total step numbers, returns wait time (in ms). See
		-- |MiniIndentscope.gen_animation()| for builtin options. To disable
		-- animation, use `require('mini.indentscope').gen_animation('none')`.
		-- animation = --<function: implements constant 20ms between steps>,
		animation = require("mini.indentscope").gen_animation("none"),
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
	symbol = icons.separator.hollow_pipe,
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
