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
