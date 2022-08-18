local lua_snip_status_ok, lua_snip = pcall(require, "luasnip")
local types_status_ok, types = pcall(require, "luasnip.util.types")

if not types_status_ok then
	return
end

if not lua_snip_status_ok then
	return
end

local snippet = lua_snip.s
local text_node = lua_snip.text_node
local insert_node = lua_snip.insert_node
local function_node = lua_snip.function_node

-- Configuration
lua_snip.config.set_config = {
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights!!
	-- #vid3
	-- ext_opts = nil,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " <- Current Choice", "NonTest" } },
			},
		},
	},
}

local function copy(args)
	return args[1]
end

lua_snip.add_snippets("all", {
	snippet("example_snippet", { text_node("Something") }),
})

-- Terraform Snippets
lua_snip.add_snippets("all", {
	snippet("allow_iam_statement", {
		text_node({ "statement {", "\tactions = [" }),
		insert_node(1, ""),
		text_node({ "]", '\teffect = "Allow"', "\tresources=[" }),
		insert_node(2, ""),
		text_node({ "]", "}" }),
	}),
	snippet("deny_iam_statement", {
		text_node({ "statement {", "\tactions = [" }),
		insert_node(1, ""),
		text_node({ "]", '\teffect = "Deny"', "\tresources=[" }),
		insert_node(2, ""),
		text_node({ "]", "}" }),
	}),
	snippet("module", {
		text_node("module "),
		insert_node(1, "module_name"),
		text_node({ "{", 'source = "' }),
		insert_node(2, ""),
		text_node({ '"', "}" }),
	}),
})
