local lua_snip_status_ok, lua_snip = pcall(require, "luasnip")
local types_status_ok, types = pcall(require, "luasnip.util.types")

if not types_status_ok then
	return
end

if not lua_snip_status_ok then
	return
end
-- require("luasnip.loaders.from_vscode").load()

local snippet = lua_snip.s
local text_node = lua_snip.text_node
local insert_node = lua_snip.insert_node
-- local function_node = lua_snip.function_node

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

lua_snip.filetype_extend("go", {})
lua_snip.filetype_extend("lua", {})
lua_snip.filetype_extend("shell", {})
lua_snip.filetype_extend("python", {})
lua_snip.filetype_extend("kubernetes", {})

-- Golang snippets
lua_snip.add_snippets("go", {
	snippet("iferr", {
		text_node({ "if " }),
		insert_node(1, ""),
		text_node({ "!= nil {" }),
		insert_node(2, ""),
		text_node({ "}" }),
	}),
})
-- Terraform Snippets
lua_snip.add_snippets("terraform", {
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
	snippet("assume_service_principal", {
		text_node({ "statement {", '\tactions = ["sts:AssumeRole"]' }),
		text_node({ "", '\teffect = "Allow"', "\tprincipals {", '\t\ttype = "Service"', '\t\tidentifiers =["' }),
		insert_node(1, ""),
		text_node({ '"]', "\t}", "}" }),
	}),
	snippet("module", {
		text_node("module "),
		insert_node(1, "module_name"),
		text_node({ "{", 'source = "' }),
		insert_node(2, ""),
		text_node({ '"', "}" }),
	}),
})

-- Mappings
local vscode = require("luasnip.loaders.from_vscode")
vim.keymap.set("n", "<leader>lsl", vscode.load)

-- Scissors
require("scissors").setup({
	snippetDir = vim.fn.stdpath("config") .. "/snippets",
	editSnippetPopup = {
		height = 0.4, -- relative to the window, number between 0 and 1
		width = 0.6,
		border = "rounded",
		keymaps = {
			cancel = "q",
			saveChanges = "<CR>", -- alternatively, can also use `:w`
			goBackToSearch = "<BS>",
			deleteSnippet = "<C-BS>",
			openInFile = "<C-o>",
			insertNextToken = "<C-t>", -- insert & normal mode
			jumpBetweenBodyAndPrefix = "<Tab>", -- insert & normal mode
		},
	},
	telescope = {
		-- By default, the query only searches snippet prefixes. Set this to
		-- `true` to also search the body of the snippets.
		alsoSearchSnippetBody = false,
	},
	-- `none` writes as a minified json file using `vim.encode.json`.
	-- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
	-- you version control your snippets.
	jsonFormatter = "jq", -- "yq"|"jq"|"none"
})

vim.keymap.set("n", "<leader>se", function()
	require("scissors").editSnippet()
end)

-- When used in visual mode prefills the selection as body.
vim.keymap.set({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end)

vscode.lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
