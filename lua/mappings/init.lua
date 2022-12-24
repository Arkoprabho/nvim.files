local map = vim.api.nvim_set_keymap
vim.g.mapleader = "\\" -- leader key
local opts = {
	noremap = true,
	silent = true,
}

-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferLinePick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Save sessions
map("", "<F2>", "<CMD>NvimTreeClose <bar> mksession! .vim_session<CR>", opts)
map("", "<F3>", "<CMD>source .vim_session<CR>", opts)

-- Clipboard mappings
-- Telescope
map("n", "<A-P>", ":Telescope neoclip<CR>", opts)
map("i", "<A-P>", "<ESC>:Telescope neoclip<CR>", opts)

-- Git
map("n", "<leader>gsto", "<CMD>DiffviewOpen<CR>", opts)
map("n", "<leader>gstc", "<CMD>DiffviewClose<CR>", opts)
map("n", "<leader>gsta", "<CMD>Telescope git_stash<CR>", opts)

-- DAP
map("n", "<F12>", "<Cmd>lua require'dap'.close()<CR>", opts)
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<leader>bp", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)

-- Misc
map("n", "<leader>%", "<CMD>luafile %<CR>", opts)
map("n", "<leader>lsl", "<CMD>lua require('luasnip.loaders.from_vscode').load()<CR>", opts)

-- Packer
map("n", "<leader>ps", "<CMD>PackerSync<CR>", opts)
map("n", "<leader>pt", "<CMD>PackerStatus<CR>", opts)
map("n", "<leader>pp", "<CMD>PackerProfile<CR>", opts)
map("n", "<leader>pc", "<CMD>PackerCompile profile=true<CR>", opts)
