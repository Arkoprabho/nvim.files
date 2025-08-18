local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"res",
		fmt(
			[[
    resource "{}" "{}" {{
        {}
    }}
  ]],
			{ i(1, "aws_instance"), i(2, "example"), i(0) }
		)
	),

	s(
		"var",
		fmt(
			[[variable "{}" {{
    type = {}
  }}]],
			{ i(1, "name"), i(0, "string") }
		)
	),
}
