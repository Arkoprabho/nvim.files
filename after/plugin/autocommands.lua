--[[
--Wanna check if the  .vim_session file exists.
-- Restore the session if it does
--]]

local file_name = ".vim_session"

local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

if file_exists(file_name) then
	local group = vim.api.nvim_create_augroup("session", { clear = true })
	-- Wait for the treesitter autocommand to be run before this one executes.
	-- This allows syntax highlighting on the open file from the last session

	vim.api.nvim_create_autocmd("VimEnter", {
		command = string.format("source %s", file_name),
		group = group,
		once = true,
		desc = "Restores the session on starting vim if a .vim_session file exists in the current folder",
		nested = true,
	})
end

-- Disable mini related plugins for specific file types
local disable_mini_plugins = function()
	vim.b.minicursorword_disable = true
	vim.b.minicomment_disable = true
	vim.b.miniindentscope_disable = true
	vim.b.minijump2d_disable = true
	vim.b.minipairs_disable = true
	vim.b.minisurround_disable = true
end

local group = vim.api.nvim_create_augroup("mini", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	callback = disable_mini_plugins,
	group = group,
	once = true,
	desc = "Disables the mini related plugins when entering a terminal",
	nested = true,
})

local terraform = vim.api.nvim_create_augroup("terraform", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufWinEnter", "BufEnter" }, {
	command = string.format("set filetype=terraform"),
	group = terraform,
	pattern = { "*.tf" },
	once = true,
	desc = "Sets the file type of .tf files to terraform instead of tf",
	nested = true,
})

-- Fade out highlight
local timers = {}
local search_timer_timeout = 5000
local search_timer_iter = 50
local bg_highlight = "#3E68D7"
local bg_highlight_vals = {
	"#3B62C8",
	"#395CBA",
	"#3655AB",
	"#344F9C",
	"#31498E",
	"#2F437F",
	"#2C3D71",
	"#2A3762",
	"#273053",
	"#252A45",
	"#222436",
}
local function timed_color_change()
	for _, t in ipairs(timers) do
		vim.fn.timer_stop(t)
	end
	timers = {}
	local search_timer = vim.fn.timer_start(search_timer_timeout, function()
		for i = 1, #bg_highlight_vals, 1 do
			local timer = vim.fn.timer_start(i * search_timer_iter, function()
				vim.api.nvim_set_hl(0, "IncSearch", { bg = bg_highlight_vals[i] })
				vim.api.nvim_set_hl(0, "Search", { bg = bg_highlight_vals[i] })
			end)
			table.insert(timers, timer)
		end
		local timer = vim.fn.timer_start((#bg_highlight_vals + 1) * search_timer_iter + search_timer_iter, function()
			vim.cmd("nohl")
		end)
		table.insert(timers, timer)
	end)
	table.insert(timers, search_timer)
end
vim.keymap.set("n", "n", function()
	vim.api.nvim_set_hl(0, "IncSearch", { bg = bg_highlight })
	vim.api.nvim_set_hl(0, "Search", { bg = bg_highlight })
	vim.fn.feedkeys("nzz", "n")
	timed_color_change()
end, { noremap = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

