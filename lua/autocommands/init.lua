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

	vim.api.nvim_create_autocmd("VimLeave", {
		command = string.format("mksession! %s", file_name),
		group = group,
		once = true,
		desc = "Creates the session when leaving vim in the current folder",
		nested = true,
	})
end
