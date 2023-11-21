vim.o.relativenumber = true

require("impatient")
require("core")
require("mappings")

if vim.g.neovide then
	vim.opt.guifont = "JetBrains Mono:h15"

	vim.g.neovide_refresh_rate = 60
	-- vim.g.neovide_transparency = 0.8
	vim.g.neovide_cursor_animation_length = 0.07
	vim.g.neovide_cursor_trail_length = 0.8
	vim.g.neovide_floating_blur_amount_x = 20.0
	vim.g.neovide_floating_blur_amount_y = 20.0
	vim.g.neovide_floating_blur = true
	vim.g.neovide_profiler = false
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_fullscreen = false
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_input_use_logo = true

	-- Copy pasting
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
