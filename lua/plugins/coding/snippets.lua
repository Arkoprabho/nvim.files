local snippets = {
	"L3MON4D3/LuaSnip",
	version = "v2.4.0",
	build = "make install_jsregexp", -- optional: for advanced regex snippets
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175",
		},
	},
	config = function()
		local luasnip = require("luasnip")

		-- Load VSCode-style snippets from friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Optional: load custom snippets per language
		require("luasnip.loaders.from_lua").lazy_load({
			paths = vim.fn.stdpath("config") .. "/lua/snippets",
		})

		-- Keymaps
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { desc = "LuaSnip expand or jump" })

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { desc = "LuaSnip jump backwards" })

		vim.keymap.set("i", "<C-l>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { desc = "LuaSnip next choice" })
	end,
}

return {
	snippets,
}
