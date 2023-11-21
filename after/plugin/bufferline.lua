local icons = require("globals.icons")
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "tabs",
		numbers = "ordinal",
		buffer_close_icon = icons.ui.Close,
		diagnostics = "nvim_lsp",
		modified_icon = icons.ui.Circle .. " ",
		separator_style = "thin",
		-- separator_style = { icons.separator.filled_right, icons.separator.filled_right },
	},
})
local map = vim.keymap.set
-- Move to previous/next
map("n", "<A-h>", "<Cmd>BufferLineCyclePrev<CR>")
map("n", "<A-l>", "<Cmd>BufferLineCycleNext<CR>")
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
-- Close buffer
map("n", "<A-c>", "<Cmd>tabclose<CR>")
map("n", "<A-p>", "<Cmd>BufferLineTogglePin<CR>")
