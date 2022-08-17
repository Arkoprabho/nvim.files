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
map("n", "<C-f>", ":Telescope find_files<CR>", opts)

-- Navigation
-- Splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Bar Bar mappings
-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
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
map("", "<F2>", ":mksession! .vim_session<CR>", opts)
map("", "<F3>", ":source .vim_session<CR>", opts)

-- Pair mappings (like bracket inverted comma etc)
map("i", '"', '""<left>', opts)
map("i", "(", "()<left>", opts)
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
map("n", "<leader>gpp", ":G push<CR>", opts)
map("n", "<leader>gll", ":G pull<CR>", opts)
