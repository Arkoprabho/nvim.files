local map = vim.api.nvim_set_keymap
vim.g.mapleader = "\\" -- leader key
local opts = {
	noremap = true,
	silent = true,
}

-- File Explorer config
map("n", "<leader>r", ":NvimTreeFindFile<CR>", opts)
map("n", "<leader>ntt", ":NvimTreeToggle<CR>", opts)

-- Terminal
map("n", "@t", ":split<CR> 15<C-w>_ :terminal<CR>", opts)

-- Files
map("n", "<A-F>", ":Telescope live_grep<CR>", opts)
map("n", "<C-f>", ":Telescope find_files hidden=true<CR>", opts)

-- Navigation
-- Splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Bar Bar mappings
-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>tabclose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Save sessions
map("", "<F2>", "<CMD>mksession! .vim_session<CR>", opts)
map("", "<F3>", "<CMD>source .vim_session<CR>", opts)

-- Pair mappings (like bracket inverted comma etc)
map("i", '"', '""<left>', opts)
map("i", "(", "()<left>", opts)
map("i", "(<CR>", "(<CR>)<ESC>O", opts)
map("i", "'", "''<left>", opts)
map("i", "[", "[]<left>", opts)
map("i", "{", "{}<left>", opts)
map("i", "{<CR>", "{<CR>}<ESC>O", opts)
map("i", "{;<CR>", "{<CR>};<ESC>O", opts)

-- Clipboard mappings
-- Telescope
map("n", "<A-P>", ":Telescope neoclip<CR>", opts)
map("i", "<A-P>", "<ESC>:Telescope neoclip<CR>", opts)

-- Git
map("n", "<leader>gg", "<CMD>LazyGit<CR>", opts)
map("n", "<leader>gpp", ":G push<CR>", opts)
map("n", "<leader>gll", ":G pull<CR>", opts)
map("n", "<leader>gsto", "<CMD>DiffviewOpen<CR>", opts)
map("n", "<leader>gstc", "<CMD>DiffviewClose<CR>", opts)
map("n", "<leader>gsta", "<CMD>Telescope git_stash<CR>", opts)
map("n", "<leader>gbb", "<CMD>Gitsigns blame_line<CR>", opts)
map("n", "<leader>gb", "<CMD>G blame<CR>", opts)

-- Comments
map("n", "<leader>|", "<CMD>lua require('Comment.api').toggle.blockwise.current()<CR>", opts)
map("n", "<leader>\\", "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>", opts)

-- # VISUAL mode
map("x", "<leader>\\", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
map("x", "<leader>|", '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>', opts)

-- Bookmars
map("n", "<leader>b", "<CMD>Telescope bookmarks<CR>", opts)

-- DAP
map("n", "<leader>repl", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
map("n", "<F12>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<leader>bp", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)

-- Misc
map("n", "<leader>T", "<CMD>Telescope<CR>", opts)
map("n", "<leader>%", "<CMD>luafile %<CR>", opts)

-- Packer
map("n", "<leader>ps", "<CMD>PackerSync<CR>", opts)
map("n", "<leader>pt", "<CMD>PackerStatus<CR>", opts)
map("n", "<leader>pp", "<CMD>PackerProfile<CR>", opts)
map("n", "<leader>pc", "<CMD>PackerCompile profile=true<CR>", opts)
