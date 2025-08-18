local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- main function
	s(
		"main",
		fmt(
			[[
    func main() {{
        {}
    }}
  ]],
			{ i(0) }
		)
	),

	-- error check
	s(
		"errn",
		fmt(
			[[
    if err != nil {{
        return {}
    }}
  ]],
			{ i(0, "err") }
		)
	),
}
