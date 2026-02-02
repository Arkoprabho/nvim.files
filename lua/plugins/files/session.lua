local session = {
	{
		-- No plugin dependency, pure mksession
		"nvim-lua/plenary.nvim", -- not strictly needed, just placeholder for lazy spec
		lazy = false,
		config = function()
			-- Session file path in cwd
			local function session_path()
				return vim.fn.getcwd() .. "/.vim_session"
			end

			-- Save session
			local function save_session()
				-- Close buffers with opencode_output and opencode filetypes before saving session
				local bufs = vim.api.nvim_list_bufs()
				local bufs_to_close = {}

				for _, buf in ipairs(bufs) do
					if vim.api.nvim_buf_is_valid(buf) then
						local ft = vim.api.nvim_buf_get_option(buf, "filetype")
						if ft == "opencode_output" or ft == "opencode" then
							table.insert(bufs_to_close, buf)
						end
					end
				end

				-- Close the buffers temporarily
				for _, buf in ipairs(bufs_to_close) do
					pcall(vim.api.nvim_buf_delete, buf, { force = true })
				end

				-- Save the session
				pcall(vim.cmd, "silent! mksession! " .. vim.fn.fnameescape(session_path()))
			end
			-- Check if session should be skipped
			local function should_skip_sessions()
				return vim.g.no_session_restore == 1
			end

			-- Load session and re-enable syntax/filetype detection
			local function file_exists(name)
				local f = io.open(name, "r")
				if f ~= nil then
					io.close(f)
					return true
				else
					return false
				end
			end

			if file_exists(session_path()) then
				local group = vim.api.nvim_create_augroup("session", { clear = true })
				-- Wait for the treesitter autocommand to be run before this one executes.
				-- This allows syntax highlighting on the open file from the last session

				vim.api.nvim_create_autocmd("VimEnter", {
					callback = function()
						if not should_skip_sessions() then
							vim.cmd(string.format("source %s", session_path()))
						end
					end,
					group = group,
					once = true,
					desc = "Restores the session on starting vim if a .vim_session file exists in the current folder",
					nested = true,
				})
			end

			-- Save before exit
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					if not should_skip_sessions() then
						save_session()
					end
				end,
			})
		end,
	},
}
return {
	session,
}
