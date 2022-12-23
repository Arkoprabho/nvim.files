local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

harpoon.setup({
	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_toggle = false,

	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon" },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local telescope = require("telescope")
local map = vim.keymap.set

map("n", "<leader>ha", mark.add_file)
map("n", "<leader>htm", ui.toggle_quick_menu)
map("n", "<leader>hn", ui.nav_next)
map("n", "<leader>hp", ui.nav_prev)
map("n", "<leader>H", "<CMD>Telescope harpoon marks<CR>")
