local copilot = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = false,
				auto_trigger = false,
				debounce = 500, -- delay in ms before Copilot suggestions show
			},
			panel = { enabled = false },
		})
	end,
}

local copilot_cmp = {
	"zbirenbaum/copilot-cmp",
	dependencies = { "zbirenbaum/copilot.lua" },
	config = function()
		require("copilot_cmp").setup()
	end,
}

return {
	copilot,
	copilot_cmp,
}
