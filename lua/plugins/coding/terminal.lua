local toggleterm = {
	"akinsho/toggleterm.nvim",
	commit = "9a88eae817ef395952e08650b3283726786fb5fb",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
	},
	opts = {
		size = 20,
		open_mapping = [[<C-\>]],
		direction = "float",
		shade_terminals = true,
		float_opts = {
			border = "curved",
		},
		on_create = function(term)
			local buf_dir = vim.fn.expand("%:p:h")
			if buf_dir ~= "" and vim.fn.isdirectory(buf_dir) == 1 then
				vim.fn.chdir(buf_dir)
			else
				vim.fn.chdir(vim.loop.cwd()) -- fallback to global cwd
			end
		end,
	},
}

return {
	toggleterm,
}
